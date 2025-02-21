Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0C1C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=; b=zYGTvWXrowev+syEM54v9DlOiq
	kP39f4QAcKBFN5BmtyTu5yWgWeEBihSfqGuiSa1DeKdmUb541RTSNatEwzKmenaIEhlSA0CNeOOb0
	GRqfOvB8/clcC7hZqcQbmoAf2PO6GsRAAflIC3YpUOVraksfybqbNpWnhJ95NsSWLwXpFwkf9a62T
	VgD+vXid0dRbtZY7rxTTqDfjQVEH/+KV4DudbdhcdVyOVuvzYwbS4EcNQ/+RPWjp357DJ3lkdmsVp
	P8PDUweh1FptLcfjufGRgDvv5sKz3bAsrZ3gm6fWgDc2lDSS0QFWqRQJtMHmydk+HXFYd3PIAyS76
	ljdB18sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXmP-00000006XI2-0IpZ;
	Fri, 21 Feb 2025 18:29:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXXh-00000006UYp-1UND
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:14:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so21278985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 10:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161668; x=1740766468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=;
        b=SzvwfXZ+zKf+c83vPKBHA9535uJzjwEkWuYkvGhv5wK1RKCEX6lZp0qZiaA/biQA3Z
         Tlr67VW4YsfogfmGbt1VyZ9VO/Yz8esBEyNNuoxLAKr707StvnS8LWfUAQuaHmFd1aGc
         GkjFfW9hRZ+tRiDUYZXLjGSk+CMUIjI0ypGInf5V0WnY/ObS7HTdwoUgqNTdwruB1g3S
         QoYMcjHDumsCS/pAhJk2luD7ZqPZlLTB06l09syFOoYoAgVbBgMwlDXiytWt39UnbB+5
         QAIwS8bXqABYwynJ9GfKN5g+kONUFTmxljA792ihy45g7Qgs1nHmU6B2iI2dNd1OlErb
         BzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161668; x=1740766468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=;
        b=IkPBJRrAm3aekjOgIeRa9hRWsVdJOdp6s1/6cV97trGUCg7sqoPbagnwsLWcoH8aWB
         y2c8Rnkefx6Pf5QUyYRYz6/1uFHS1MpejfrOrToFgHlBADFyUxp8BkdokZ6qMN0Bjc3I
         gbvJHBkuARqOKcjW8E4UYf4CbxLka5HFRs9POSsw8upTB1C+2EN2bntJXXEK7Jhs96Cs
         3cvIeC5Mb50x+BpFtmrOyR/xNIHC2jKWVxzydgu82jqhMQMnuDaKRMa5VUKF7ejqqXOf
         4xLpHh3tYadbLcnwhIVP43Q8egWiPmRjoo2WTrFbZtQo1XzLzSVNYxO8R/IBDWd5gx5s
         t49g==
X-Forwarded-Encrypted: i=1; AJvYcCWwr6GUx7FzsH8T1YR6t/0VSlCtZGlpJyuogf/J89v6QFS5hg2Zm5SCgZQrli2hRcj3Rc9YNSLjBETjD3OA9Lxm@lists.infradead.org
X-Gm-Message-State: AOJu0YwQUBVhltPlzxNIItjmhSoNZYVWacZUsF07bfdoIzkiNvivt0VE
	ND64dh7DP7IDG8bRjR0jyDUHy9PXciy+whida3LCZxdmdxhN55Ck
X-Gm-Gg: ASbGncs0Txn4yVRrWNqF4e6B9hjQZ8AuRDzmE/2XzNzbK4KQ2zvKsmfNUrJp80u9WeV
	tI14aYAGpwPZF6df5x8jp1onzWZYdFqSkCaDO+4c5TSognabJVTKOWygU4tNzeXvdob7M99Qdld
	tqWz/ES9JGfa7lwssJsMdoBJRL9HuNs3FFCNBM/C3c5M5HrqFQSxZcF9eQPsZBrr5mNxsDCtDck
	otxLkytatNuypkS6Va7lh9YKBgXGu+v0T8fUtPTFEFbIarN6Bhf9dchD8+N3BKGfWN/LQs08toU
	dt8u4gZUNz49dvWN5nVlMMJUJowbzPSanhH6yD/SYT9jJZH2HVvPn/M7zOW5fuNAU6iPzME1JGR
	0rw==
X-Google-Smtp-Source: AGHT+IFTozi1CVAZhzesUHKfQ2k63P/tS7KXhTKQwhP11mPloHJVn0P3vCQGwTQrLHtArYDTD3nLVQ==
X-Received: by 2002:a05:600c:1396:b0:439:6d7c:48fd with SMTP id 5b1f17b1804b1-439ae1d877dmr40268755e9.4.1740161667381;
        Fri, 21 Feb 2025 10:14:27 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030be5esm24430595e9.30.2025.02.21.10.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:14:27 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: h616: Add Mali GPU node
Date: Fri, 21 Feb 2025 19:14:25 +0100
Message-ID: <1911773.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250221005802.11001-5-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_101429_394207_0904587B 
X-CRM114-Status: GOOD (  10.98  )
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

Dne petek, 21. februar 2025 ob 01:58:01 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner H616 SoC contains a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family. There is a power domain specifically for that GPU, which
> needs to be enabled to make use of the it.
>=20
> Add the DT nodes for those two devices, and link them together through
> the "power-domains" property.
> Any board wishing to use the GPU would need to enable the GPU node and
> specify the "mali-supply" regulator.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



