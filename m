Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8CAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=; b=IJ1L1pAaRtCqBB1jmkF9v80jkL
	w8m5yiooInU9hlfDab75EQYEzu2TSn2V2Hd0nU5OTVnRxIupYuA8CDuzhbSvCqtSriPfOF1rAUvyz
	TH82xz/jNcMg2H9hOa94ns74TKsgkFeGL00tv+/CNENhXQCVm9Hv3TAniTPd8O8vq1bt0Rfe3jg/0
	/EQrMnLAWybDkNkDrupE0XNlXBzcpXX3e3Wh31g1kxYjashauqQvVMJYu3V0zBsWC0JioMdL+V9IF
	kXVLL5xcolwWNHvMu//tlsBNoDrVmjvOJrcCvQlGO2g4h+bknv8jV59fTSKxxm2Scn85Ld+nb9OIz
	1AP0Fm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gly-0000000609j-06Gd;
	Tue, 15 Apr 2025 13:56:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gZO-00000005xaT-3HbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744724600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
	b=alAQXHpm6q7vB3vlrIfi04Cz5+LYp0S/EVncI2bIVPU02L8MlVrt4UAhk27E4JKMAPwxhs
	6k+TDMoYps2stPdSVulH2BIBBxRElsqlYNBks5jxWsY+nbBmdDt/43w6C4hAqr9iHdDu8Z
	zpZSilMmlt9BXbVOnIz9+RGhK+yQxNk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-or7LBIS_PIKXoBMzRlKBcw-1; Tue, 15 Apr 2025 09:43:19 -0400
X-MC-Unique: or7LBIS_PIKXoBMzRlKBcw-1
X-Mimecast-MFC-AGG-ID: or7LBIS_PIKXoBMzRlKBcw_1744724598
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c30f26e31so3744864f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724598; x=1745329398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
        b=CPGV+/wzIbaLlMU1cJWQRIi15PiAWOC62Rwl8ukN3BlD7G3yUBNwmO8e/GKg1VhQ49
         VWP29NMckfapmbpsLmb6Za9rAMfwdyvJOBm4woOeGPApL48fB4Tv5KAKk1PkElpuj/of
         jb7HsHIRAes4Rym895s7hffihApqPuvy5GiZkQsuucRmkJV2D1K6lu5aB6jFe455YRey
         jZyWMtucCmD93qbzIitE0JPnlQ/TZWlSTtfL19NVQ4N+oBqPkg+gVkvyDvbmLJFP83iY
         8ey0vZnkTKtsqRZ8xj0bABQEckCmCt6CtwujutfsvylxNGVPH9DdvvUMgd1C31ScZNo2
         XytA==
X-Forwarded-Encrypted: i=1; AJvYcCVl29sQNfAtHpoUnVl+PPTbgyShtyE/2Cokt9GSnjUjOlJGp7i2TiR5umPxEzrxCFqlOksdRv1t882mvdln4UM0@lists.infradead.org
X-Gm-Message-State: AOJu0YxzBTwu33Bl6hpTNZOXHG+JDm5O5Woo/QkReb9PesYghsOvWl8a
	HrRCXXU17biHgQW8aV6g/0lMJDhfrawnbWpSnQQVD9Ndyr8+xjliLeRkKQeY348Dod2d5aPFxJE
	CQUCWBFIsW5sYbyrjjJ3CZnQrm+mrInKpecODB7N/C5vSaHkXsiTcK9L0vZT7qKK4mjgJ3DAS
X-Gm-Gg: ASbGncvSxKZkxdRhIz7yqFALLrJ+hpDRxrr47Km/X3QgU8ZIQa9jTT8P2yB6TjM90Tm
	eVvbk1qVKD18587FrndlL9kSEPbrXGw+spEZzxCPQH7NJARJLRyHp8WfCoTwCJJHvdlepnXFxrb
	sMJz/8xsQWVPxOo/AadsU0o1dwihvIZ38fWfSEZ89nX49FRrkmMjywicKx3dlsuCehzmgGHLvLX
	ZVNO/nfmNFYNs0xfP2WbcU2WXoCmRwGcYQP6mk8dw8u4/qqwpmyS/3llR/+gaKerxTzOKN9ZdwK
	tsrHhGG2trIVgoi8ITDZaF9MmpuApv0THa9+WEI=
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282367f8f.33.1744724597994;
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0JyZk7iu1Ps9aWjZNEP8lEOiYdz+v1T/ibFseJb/dw7p9p9LOXvKaUssvdPPF8RDwWIrTgw==
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282344f8f.33.1744724597586;
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Received: from [192.168.88.253] (146-241-34-52.dyn.eolo.it. [146.241.34.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c02esm14065754f8f.23.2025.04.15.06.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Message-ID: <4ffd3630-bc75-47db-b63c-3dcb7af8249c@redhat.com>
Date: Tue, 15 Apr 2025 15:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 06/14] net: enetc: add set/get_rss_table()
 hooks to enetc_si_ops
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-7-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250411095752.3072696-7-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OaaTnyA6D7T3jntbeJib160gtKgGCOuCBteJ2jBMz-k_1744724598
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_064322_890355_D00C3148 
X-CRM114-Status: UNSURE (   9.90  )
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

On 4/11/25 11:57 AM, Wei Fang wrote:
> Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which is
> different from LS1028A ENETC (v1). In order to reuse some functions
> related to the RSS table, so add .get_rss_table() and .set_rss_table()
> hooks to enetc_si_ops.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
> v5 changes:
> Add enetc_set_default_rss_key() to enetc_pf_common.c and use it in both
> enetc v1 and v4 drivers

Note for the reviewers: this changelog actually applies to the next
(07/14) patch.

/P


