Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D976DC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 20:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR0EpZECN4ryp0h05eQXFbtfZW6WoZHapCp9X04ymH4=; b=x6EgJKyDSsOqS6XciGk3xrUGtG
	gK7QyY+zB/hd+YNtf3IP36/8bzQ+qutyh5xt3LkQzz6TRXC54+HvCJ8QT7jVdNwpDaCu7phz+cK26
	TKvpITFuf64iuA80WBuyQjPo2GJPd6xzdh+4O81sNHfXFIW5YhIJrVex4pQgVfvaKRTxAFi9HxUOd
	0MPCEOfFW4/CRW6RE2VuPJK3mon7JSOq2hoLWWNA9Bhl3lOO1okvtKutB2vuoAy/MSMjZwCbk/apM
	NZQkAqHNYiiNDh5yJLI/zl7Zu1zCVt1dM5hEOSZthiiHT4OCchBE3HBN3YIUHyePV3FV56EFEv09r
	MS8RuB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublr8-000000067sZ-10Dd;
	Tue, 15 Jul 2025 20:02:26 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubloh-000000067ge-3FuE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 19:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752609586; x=1753214386; i=wahrenst@gmx.net;
	bh=HR0EpZECN4ryp0h05eQXFbtfZW6WoZHapCp9X04ymH4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JtG7AjfvD6k/tlU6+/0UVZt/HvDFLTn9G2OSQFrlEWhhDB1uAzRBEyxlJ9mu3q7X
	 NAJqueMfeC1zQ9k53OkmPZxuJsgtXweaWsIax48QYTwFgXwDe2S3dbslmLShhm1n+
	 MzEEJfmv+la2+keeQRDvJIJ8LQjUWSnABIhKiwLn/9aCE9gzIvakcg2pz9gNddObm
	 yb3yhg5jDa5MpVFt1OdlyAHb/GpuJiqoc54er7tQJ2ZdmAS3BOpw54xebc6N2NH8n
	 k1UQcOgB6bXVR/uLDyfb0Z4ehqTqxG3AOjIx/OKFzutrTkIxf0nomSFQesntTHO5f
	 bS/F0lmjbLtwZjmMJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdefJ-1vB6Z63T8r-00dey3; Tue, 15
 Jul 2025 21:59:45 +0200
Message-ID: <5e9e606e-d227-4d87-a5b7-cb5a105dcd98@gmx.net>
Date: Tue, 15 Jul 2025 21:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] staging: vchiq_arm: Fix regression & resource
 leaks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250715161108.3411-1-wahrenst@gmx.net>
 <2025071555-stubbed-hardiness-8306@gregkh>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <2025071555-stubbed-hardiness-8306@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zYVKzfcFd4uGENI+HCFCOme+S6BbXKaojQ4vnTYwyqZe48UWwM6
 L0y7Or+n/6u5nD1nXxDemfrffoB38IqvP/wVZuDGykY8BuUQTb70FYOw/w6GvN5/p7a2JMj
 Uj7/Djn4EgtVQolgs21XSVPwf4kee92V2rjyfUwOGejxxYVOvQFKSBCt6c1Th/al6IawbAJ
 MOAk6/VlC9oJG8OydfgtA==
UI-OutboundReport: notjunk:1;M01:P0:qNOfnrjXf1k=;w6rCnlbxfUVZixrZ8u8YNeZWgQa
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_125956_113677_BEBD4A2E 
X-CRM114-Status: GOOD (  12.66  )
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

Am 15.07.25 um 19:44 schrieb Greg Kroah-Hartman:
> On Tue, Jul 15, 2025 at 06:11:05PM +0200, Stefan Wahren wrote:
>> This small series fixes a regression introduced by recent changes and
>> possible resource leaks in the VCHIQ driver.
>>
>> Changes in V2:
>> - Add Ma=C3=ADra's Reviewed-bys
>> - Fix Reported address in patch #2
>>
>> Stefan Wahren (3):
>>    Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
>>    Revert "staging: vchiq_arm: Create keep-alive thread during probe"
>>    staging: vchiq_arm: Make vchiq_shutdown never fail
>>
>>   .../interface/vchiq_arm/vchiq_arm.c           | 98 +++++++++++-------=
-
>>   .../interface/vchiq_arm/vchiq_core.c          |  1 -
>>   .../interface/vchiq_arm/vchiq_core.h          |  2 -
>>   3 files changed, 56 insertions(+), 45 deletions(-)
> I already applied v1, is there any code changes that are different here?
Strange, I didn't received a mail that the patches has been applied. No,=
=20
there wasn't any code changes.

Best regards
>
> thanks,
>
> greg k-h


