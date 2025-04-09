Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD0AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeWWBGTjlUvvFQ2dwgcDW5DN0xlT820wyIW0MjZrGlE=; b=zVMn7edb9JKLDa8dmpaWwMp1Bm
	gM9YkOWlmxsMUMfBjLY3SximlJ8XAB6PIOnPq8LdobxZ8ynbtcc36rjD9EpBdd7hkmXi4zZ9c12dT
	N+MJRm6nXm/wWZRnwgIm1pHYPpcA9YvV2T9iyYZM/MRj+XBuvrEU5Wh3hs09Qdaobi/TUqof6aZGo
	TuNy4O4OiVGuMeBU71npNHZML2XQWEg3F/p3AHsFBXTR+whdl2W1e4y2O6aQnCgix7pnUbOO2mhbO
	fevLbirhIXLPOT14YE7yZfCk/H3garS0qAxVp76msFFXcEoO7/79tT952YGopqJw/1VAirH/ij+XQ
	hBMLJZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Us4-00000007CGx-1ODk;
	Wed, 09 Apr 2025 12:49:36 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Upg-00000007Bxf-3tSb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744202790; x=1744807590; i=markus.elfring@web.de;
	bh=MeWWBGTjlUvvFQ2dwgcDW5DN0xlT820wyIW0MjZrGlE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KOC8Czrkj4FVNXeoWnAAhjtN367USJpwt1kZYmG/65l3/Ew+NnabXSYJLN36/ZJB
	 SZafwzsNrP02DPMfY23b5IZ5Y3XkwESHF3ONKvGvQzC23Z/zoQfBvldxf7NaeTNXJ
	 UKgUwpcaen4U/liTzUZAi8lJP8/f5f+fPx4771cbdhF0F8UGxgnIhNVD2ikymPiVC
	 bIHL58LaMAFAQUGArD9Plkygfa2JHjkh7ohjgjhxoKiASOMBZ2goAgFa3F4FnamFl
	 U2/ymC8IQbGSb9cWRlIkLZIzm2hWqVJbm0wASgaxusPLZJ0GUYc1T6RVhT1eiov53
	 B4dXTWCNSP35fhAS4w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.27]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MW9ra-1tZFvQ36Mc-00Lc4g; Wed, 09
 Apr 2025 14:46:30 +0200
Message-ID: <e10ecbe1-d8c3-444d-92cb-647a1c54675f@web.de>
Date: Wed, 9 Apr 2025 14:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: crypto: sun8i-ce-hash - Refine exception handling in
 sun8i_ce_hash_run()
To: Andre Przywara <andre.przywara@arm.com>,
 Ovidiu Panait <ovidiu.panait.oss@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>
References: <3727de04-7993-4b81-80c0-adb40b847307@web.de>
 <20250409133610.59d42bec@donnerap.manchester.arm.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250409133610.59d42bec@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fGRJhLFb/+v0O2mafP9QCc0EviHzvpX5ikoqmmYcIiWSJhKDnDY
 fjojfNZCKBcliE5Cmge9pM4cqDNVFNDHzBofT//KsNmyshdeZPDLItuLsHCvUVWc5cZ3G1L
 CaUjYAi2hu2A37x9JQTjlm9d1152fqk24dPLQFMnYSyV/f7pSncretj0sJdj5thPnr+uJue
 EWh45MonlU0WyMkJT5X8g==
UI-OutboundReport: notjunk:1;M01:P0:2PalMa3QEWk=;gLr3Yt97VScssGDAYWAG6YNzSG1
 8QkarCyeTXM9UGR3C4b8kQiGX7QN9CLLSJoZa31hEhIc/WpFat1dMp51bwZ8In4f7TEhJIk+6
 lDqousHP2E5M6YP1chKxQa2vDyLIQeS2ZvmrwUVJtsE7OHpXDbLo9/lon6GCjQs0Fs8nokXWI
 i1oYak0FYJanAx7gtDgrZfeqt4g04RqxuhS1Qb6C9aU85nbkFaKCLpxd70Wdph1xh916zkE0n
 xLMvP23xXJcoP5AKie1j4N2sXkiwSNHCCmM2bS0s6BI8l9FIhdbznWAlr7CdmAMPxtLE+9NQX
 UBH2lGVX38QXskZ8li5EmyzxLGIprh0JBxERToxZon66z6CTHxfYx1UFFkByD8UUkWzltxr5j
 ZbQSj2uvptUIOfOLEIw2FJbsQjPgbFhqYx98AsCE4P3COjKDP+i98d39JzApMTt2a9XcFKEU5
 zXMBM0TdSY/gTFPOZccfPEXOAMb5OsBAh6ICtGvLBOIlMDolk9PmuVIPAGZGjOLxlZ0+d2KZm
 jeKbsvuxkvA737dOS5IF1GoEIqKZCuxoG+L4P12bWGyKtURmLZXiLB2pevRCmcmtq4I+vsq+J
 q6RMzE4xXtYzyJoi86LJuLOgvvXPpHfaOnvV0HXsKondRNOv8VBk5QUMqywL5fkEygaNBZtK8
 S2Y4JeiCE+aa+QWjrZ+eRtmLA0Q001UNULWBH30kLclzkSeOG9nQw4b9EMMW+0wGHKXVtwdN9
 1vK5bUFLcGFHvZqut+gNv4mZAF38Fki48GwLfbeFD8pHC+GRBHI4M3ej+raH9o4HGtjq5vU3v
 eY4APlCk8OZgFOMSvW8WPO+7dX9OD9eRIJ0yyTZH/PsfKhaPI1oSMp2Ml37ETGxPtdTTaNpmk
 OJyRh+Qo973VajckcNMeU/jEuOAKvgmh+nBleGJvogSIFZt+h41BBGPFtLub55ZpB4uKDkRjL
 vCogFtoAs9PvwY+AqMVUbfNEjdUgKThgh4MQKaYk7z35a2gnrGGiyTJER8/KqoyQ7wjCvK8Ua
 zVsKQYtkjUN49WD8IO47NY7/xD7h1zPzWTb+dhSVzvHuVCYbd0sBWRtpf/B7ZQ+izDfCwMUSU
 +SfQKcGI5+FFt16oSHMPnvWFobp/QEZNouXfxn/F5kyIi/QCVddxVV5Abu1oNrD2n+VNCoR4E
 YZTjxGnGVMsa6RpGB0CvhmBPMBAuApFTYf3EhaSHskeZ7Og8sWT1JTSojzpOonDtnMOh/pump
 Iytgv/pKSQsqPsqWrpjZykzGl4w9kKJWaFqKQQOs4GgwwMtJ84h1lrbuBVoqO+8NP52rWwZRd
 sDqBd6xEOoahcmZOpFe4xIH/yZDpnAaQnI6GeUzi/n5vmp+c7vav9qLE4sb3PRf9jWcpGURmo
 J+sJr7TC6WBjAmuaf7oUJBuc8nDc+qbpawoC98NszBB1slMhhbiSDSGNGFNMc/Sa3/h7Ahz7y
 68vdnKhJgrhJcdk3B3lp1d99it1pmjb5+nCMuKIQYpsRB7D/IJ+XapwyMmcu9CGQG/Sc29whU
 4j2msyib3Ks2uSfAyBM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_054709_254052_AE95E0F8 
X-CRM114-Status: UNSURE (   5.52  )
X-CRM114-Notice: Please train this message.
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

>> Two if branches contained duplicate source code.
>> Thus avoid the specification of repeated error code assignments by usin=
g
>> additional labels instead.
=E2=80=A6
> Now there is one rather opaque label it goes to, so a reader doesn't see
> the error code immediately. And it really just saves one line per case
> here. =E2=80=A6
I imagine that such a code refinement can occasionally matter.

Regards,
Markus

