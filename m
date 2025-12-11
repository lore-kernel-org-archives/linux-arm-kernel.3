Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA1FD41C3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypzGs37g1ijizc80SSvmoAUEXXtetijEMnbM5bEMyAY=; b=mo53FhfEt4cV7uPJ/NHJbp9HEd
	9z9A5RZZ2yLTbaeGPsUR0LwvQIZvSvveVObw6jb6rFclans4yHhUpp87GV8zq+hhffjdyg7tTBwP8
	cqcSzEUiib5LcrC0HF663qwwjWzUa2vWjzuIcY4M4FussIiyv1Q3aQck/uDqMYdRgZ+dUDYTKYzeb
	mU3OsXjVeA2zC9IcfshPdCR4uiZu2RGmQ3GA2Xm+m+0gK3I9IVW26CUytKQqFH9zfBQ/QpowCRkv2
	AaC55llKNBgvfBWeUbqpFuYLxQEVF/2Sgd5+0u5khdJLRbvQnS6IKoqU/y6rt9AvxL0dKdN6x5qUA
	dgre85dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThbV-0000000Giql-2BaO;
	Thu, 11 Dec 2025 14:25:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThbT-0000000GiqI-0rFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:25:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477770019e4so1601195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765463109; x=1766067909; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypzGs37g1ijizc80SSvmoAUEXXtetijEMnbM5bEMyAY=;
        b=l5RQrgBcVltuS+FbpxdEMxvuMsvykO4lFd7sNfNIpWqsTO69P2CR7dh0Ah/UAXPKVD
         bOev6zOt6BXZo3cK4vCTmnKLwPiYnNieHb+Bq5XvTM7wOgEUp6KMeeu9OvxjtbFvdTgE
         wOJRTUsgJ6mk9zuf+68c2K6sd8ZMXazRNLCTSa1av0M4EMji9x8EniTY/5BLtJOP8dkF
         CT8pyIjEl4gDUUkWfnQzpinilotG9clwyS9alh5lmKfkPd8enwspjU56A31bZhrKZXAj
         CXQIERHrrOSQn5GMFUZ45J5QN7NpI8DuOThRC85ebzoKVQi8kh/U0Lv998tW6gauN6+A
         3egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765463109; x=1766067909;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ypzGs37g1ijizc80SSvmoAUEXXtetijEMnbM5bEMyAY=;
        b=iRBDR7MyO4ycVcvsEx8fihKFoDdlI1acvtaTRk/dr7cMjQNelOHkV+n5mm8I/OKXin
         cYUB7bGhVLKfqw48LhwjITMibiFgDpiQjXqd5kCFlz73KK2TPNl3eLCMX4GkJG/DN7h+
         QE/nxsWP5WQ/DjIrc2NRGSQxBmyIzHG4Cyr61Hn1BAkhzQ9NBSAEKTg7C2u8zKNTlYCF
         wsRBp3V1E7BgPNAYUXpmrI76FV+SkqxpucCzA1YYNsPWq/D+I+dP3sIN3yMWhu7pZIAW
         HuXjb8oZi2KGbieK3Mwzt6TE3/3BywdPdfj9tr+ZiEqQFZV/V3P5RTh58bF1PWV8t6w8
         A6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwltFwjw+rlC/WiiPzVj2dp+yextqvS1VSxh2DKM8VI7GzLV3duh6GVWZidwMzjNHTOx8QlBKKSxgzkxqMNJQF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw2Wq+edQNPTH/RhuaZ3P97uqPXxAhyDwJMEhcU4VKl1OGXaAX
	z4NNaRMGgPdPz2pqJPM9JCzuyXAsqHm+sLf5EVG9Y5wf9WMxjMgghGWKwMqZTT6QdBo=
X-Gm-Gg: AY/fxX5/AbyoHHaEEsKYBoLV6kt8ny5HYyJ17zfQaajWnIx3Zx2WEb4Y9wy+VeGTtad
	fFpSov+WElVpsd2SzBxuX2sqfnEdVXjMziXNkuPPjndnckhwByvowyUfnjpygqb8k7bCsilEerU
	yAMc3aABZOsCe0YkPSUlrJumfJXKB1XLJLEydt8SPk17g8kzYq3+ya3Oyog7OCTLAHYHFRfALSo
	FYzk+QIz2PoDGId9yNx13/OMp/4CwN5ZQBx2GRcn0oCFQFwr6g3vv4+ni5Km/KaQebpYE+WfBxS
	TCE3jQRVfKhMQg4sBUN5NZGj108jte0pXBaLHyw2mm4uYZ33DmP3GYUia7yz6cRoOQrXtdfEGo0
	n/croXKQWLCK5Frb6wHsS/8ds+QXMqzPLWv0E34IVfsYJXvOzDX6/4w1B5WWF5ELuZbK+fe6qTj
	7kArcJA0DbYKSJ63RE
X-Google-Smtp-Source: AGHT+IFqWEN8sqh579V/27ddTYiJenJl8LmZUFBNlJ5nqwZi4FWTc0j4oMC+Tm+I3rDoAG2WVaNLlw==
X-Received: by 2002:a05:6000:26cf:b0:42f:9e75:85f7 with SMTP id ffacd0b85a97d-42fa39db068mr6789670f8f.28.1765463109070;
        Thu, 11 Dec 2025 06:25:09 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:c186:ec41:4ac0:f434])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a6fd62sm6467992f8f.10.2025.12.11.06.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 06:25:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 14:25:08 +0000
Message-Id: <DEVGFVA8N0N9.13ZJADVNM9PHO@linaro.org>
Cc: <cristian.marussi@arm.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>, "Vivek Aknurwar"
 <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
 <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
 <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>
 <20251211-wandering-magnificent-yak-5fb19e@sudeepholla>
In-Reply-To: <20251211-wandering-magnificent-yak-5fb19e@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_062511_273968_74196225 
X-CRM114-Status: GOOD (  16.52  )
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

On Thu Dec 11, 2025 at 2:07 PM GMT, Sudeep Holla wrote:

[..]

>> > Ah good point on confusing commit message. I just assumed it is limita=
tion
>> > of the implementation. I can update the log when applying. It is not s=
pec
>> > or protocol limitation for sure.
>> >
>> > How about this ?
>> >
>> >   | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
>> >   |
>> >   | Some platforms expose more than 32 operating performance points (O=
PPs)
>> >   | per performance domain via the SCMI performance protocol, but the
>> >   | driver currently limits the number of OPPs it can handle to 32 via
>> >   | MAX_OPPS.
>> >   |
>> >   | Bump MAX_OPPS to 64 so that these platforms can register all their
>> >   | performance levels. This is an internal limit in the driver only a=
nd
>> >   | does not affect the SCMI protocol ABI.
>> >   |
>> >   | 64 is chosen as the next power of two above the existing limit.
>>=20
>> Yeah, that sounds better :)
>>=20
> Thanks!
>
>> I also thought that this was a driver limitation, not the protocol/spec =
one
>> as stated in the original patch.
>>=20
>> I don't mind updating the commit message like this (but I am not the aut=
hor
>> of the original patch).
>>=20
> Vivek, are you happy with the above edited commit message ?

FWIW, with updated commit message feel free to use:

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey

