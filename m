Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B23CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 04:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlnQ5BAi76HPvHhocPivvWgaZ62tTTuvYoTCH/OutaQ=; b=LFLNm5Qhubdzv+Qb7Dz4Xkg+d4
	h5G988bzPpXP3mZmgWVotU7Q7PrmX6fiBF5Y8+pBmwVa/geDberAyOMmXzk6vnDH1oHUs0dMjGeQY
	tBXWRFAYfarBabp9uZCGynvLNZ+gE6qNgs1eTQlZPbyytgIQM5mTIvSX7SsCqj0s6lgNK4dsNKhUO
	XRzfXPSj000oE/bA2jwnujzTiT0C/38TL4dSb0BxxX6mHjjzKBYyFO9Mdmi0U2zYnRxWJ6nloyNat
	vs18dykVlDg2PtlcE1C05hs2RI/sG8Jzv81WifyVCm/lauYYfJU7spfVvYdrvI2L99m6FE3VdIFPR
	cp+25qBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQICI-00000004nMw-1OpH;
	Tue, 02 Dec 2025 04:41:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQICF-00000004nM8-1xL5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 04:41:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso1123404f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 20:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764650461; x=1765255261; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlnQ5BAi76HPvHhocPivvWgaZ62tTTuvYoTCH/OutaQ=;
        b=UhQycKWF+aWhk8+voe8w3lcxHo6ZzZV3FvEQSbrZUrKf5MQ1SFX36+TikwuAW676bp
         nU4meKcwSAR6P75OKc3y3ZPlUeMKZlBIHWZaGHuXTKtnoPNmMVjfXn+SjR0hun2e1dIC
         ZUt2kzkp+CZzJf+cLDIvTS5NFEUDkTqfaJtODM1EQIGHzczurrL+6AP13DfydHH8tXTg
         7B9jLAzcC0FOwc1Y85zOqkl30r5ZhbsHRerTnh/z0hLp9/opSyvaYPA8Ho6VrWm+Lt1f
         oOtvBN4j9hfo37NyWZZX3zDaICqdI33YY+9PzYqhtvcnpULexZawoM0VY9CbDUbN2wTw
         UNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764650461; x=1765255261;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LlnQ5BAi76HPvHhocPivvWgaZ62tTTuvYoTCH/OutaQ=;
        b=WwXnBfBK0VWwHt5MOm5pxXVBfNEld38VpQy62smEY/6jE4pB7lQertPMJufoAjo74D
         e8csarGYHBr+o3fq8YgsKaZy/2mRoP7JtbdXFNMG9fr77K5gwDoE+T8FVX1+jPf6v22s
         CKy8t+nucJcBR0eL0oxW14XcvANbtDooGPHoop9AsrGbZ95QKqmGDvj66Q+O2Jn+lICm
         bMRnl+kj8T4BaFFv5vMlKzOHONAPXp1LrRonow/2uiWtqA63NTQaiVzNhQKnRSjhiMVH
         06olKfOoj5h/zdusDEW9rf4vw00qBUuAz7y1q0sZzWQYSilAtgJZR6zyWX0vze3ipLU+
         o7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCX/BR1x5+Z3uiEWdHJ4aJ/IysBezdBkZcfi7yIbzSTQsdGxHAK8Hi6rrH6sWtlxoi+dX+QFpgDqSeuPBYXte4s3@lists.infradead.org
X-Gm-Message-State: AOJu0YyvA+1TQP1epClgRlU58y1Ym0wPyv2IgByd3WHES27JSUeXvKMi
	GzqNX4gFcMHBVK72wuiVFZUfkKcT7Ix1XzTYlYV17ko6DNzlUekprTF+
X-Gm-Gg: ASbGncs0YoxvbBjBbE3+m74nnm8EQgfrq6pPWt+83YGKCjnhXWFVbH6q2nGTr1SOyQy
	pLVmFo0AZmC0e1t3bozanvpHa/djyd1thA+wtafGBUGl27NyfKuizDFqIzmDrBB0eW41NG3fOkY
	W7DhmKwWfUvJehA0o82rIBPaLDsbB6HaMT7epeCZt/M7TrGREWRxN6Lj+pFH7NP+YyU0jffuE/G
	WpaT0N+GeblYt8ZFgli+LPICfgkZiNQPMRFsW5HKxjYiU11DFDuaqo3e08C7N5ROvC5pj3RWm/d
	xxjSDdxLanQmMMPhsXKyZWTMrAA8/vVShhicufwJGddIeD7E1f2BHt3Sg9JgWTo2Xcd3lYTl4Im
	D4lv9x0ZxXG+390GyJl+KJtTMRKLr6XJgF1b74mkNmYsxHS89w3dr+Q1GQQzuT2a2sUVd+jtjA9
	tI8uNRSuI5sWLbfTKOHC6mMLzKafyZl6/kGhiC0aeI7u/X4y8c29BIIhMboC/jr/1NhlfeKtBWF
	qzGwcH+/A==
X-Google-Smtp-Source: AGHT+IGBVfHoicF0puR2bTLakkUtiMzuIbjHAPDFKoGgk5PNnZl7XxNKNFA7iFYAa4+wXIUlMt2vww==
X-Received: by 2002:a05:6000:26c4:b0:42b:2f79:755e with SMTP id ffacd0b85a97d-42cc1ab8874mr41867616f8f.3.1764650461201;
        Mon, 01 Dec 2025 20:41:01 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm30712057f8f.15.2025.12.01.20.40.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Dec 2025 20:41:00 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH] wifi: mt7601u: check multiple firmware paths
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20251201103529.1874a869@kernel.org>
Date: Tue, 2 Dec 2025 08:40:47 +0400
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD5CBB8A-2829-4436-9DA0-D1A88D594E92@gmail.com>
References: <20251201090336.1157193-1-christianshewitt@gmail.com>
 <20251201103529.1874a869@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_204103_523241_31074ABB 
X-CRM114-Status: GOOD (  12.95  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On 1 Dec 2025, at 10:35=E2=80=AFpm, Jakub Kicinski <kuba@kernel.org> =
wrote:
>=20
> On Mon,  1 Dec 2025 09:03:36 +0000 Christian Hewitt wrote:
>> The linux-firmware repo moved mt7601u.bin from the root folder to
>> the mediatek sub-folder some time ago, but not all distros create
>> symlinks to the old location the driver checks. Update the driver
>> to check for firmware in both old and new locations.
>=20
> IDK.. 2.5 years ago.. how long is too long to wait for the distros=20
> to update their linux-firmware?


If compatibility with older firmware locations is no longer a concern =
the
previous patch submitted by Daniel is valid. If compatibility is =
desirable
this patch is valid. I=E2=80=99m not fussed which one gets merged, as =
long as
one of them is so the distro I maintain doesn=E2=80=99t need to patch =
the driver
to use the =E2=80=9Cnew=E2=80=9D location (our buildsystem doesn=E2=80=99t=
 process WHENCE
which adds a symlink back to the old location the driver still uses).

Christian=

