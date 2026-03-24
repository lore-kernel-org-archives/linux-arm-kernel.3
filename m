Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679C1E9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i878IeteLCFxRLD+ZUMxJT9JCdjyYuc7imdtSz1y2IY=; b=QKvzqYfvaf8LM9UG8BDq8JNIEE
	LZeEwnkbF24wqI5idLNtwn9iGlQV/gSOEYfGnwv8l4/f3D+NW1xFlUMI1PalsbDjZZUTHKQDgON8Y
	admt7zpb96vPX0jSYniO8bCA5nS0NReGLyzySaUYLPXY1y7NfWycxm9Uk7RLgahU33Re/UdvA/vef
	MSrrkCrwYwcm/QeCpEF5gNkc75FI2Un5JyHe3s5Slo2x02dDWZN4td8KNp1upHGgdU/rFJ1ceSrod
	NugG9/m8YxUracEniKRSU8YD9gK3tofEztGuo9C6JUo0hF1UMF3qLeTPvkorfXDVxNeaxLbhf9ObX
	se8ge2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50ec-00000001LxV-44Pm;
	Tue, 24 Mar 2026 12:14:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50ea-00000001Lx8-3CGq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774354475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i878IeteLCFxRLD+ZUMxJT9JCdjyYuc7imdtSz1y2IY=;
	b=DIn9PUCGcGYbtnPVRHg+bRypRvRZRXVADkkn2SEI0uoGZHAXdv8qVdKFhPK16NB6XAJgbI
	5aaYy+dpwWjaiJ00fZJqOWoc96TK4Q4AtrzzGUEa1a2HclQKZHwT9HTCkJyitdYxXavYjk
	vMuUOQwzN4p4cmrKoKfRNU+z7HHWzN4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-f42GgbueNcSPCpkLlItoAQ-1; Tue, 24 Mar 2026 08:14:33 -0400
X-MC-Unique: f42GgbueNcSPCpkLlItoAQ-1
X-Mimecast-MFC-AGG-ID: f42GgbueNcSPCpkLlItoAQ_1774354472
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48544725bdeso53690375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 05:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354472; x=1774959272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i878IeteLCFxRLD+ZUMxJT9JCdjyYuc7imdtSz1y2IY=;
        b=WXOk4OhOAedQv6oMMf3Uf+V8fyBNJdrlu7BJ5MIpFq+fQihw2FR/Mc7PS1dJJZ7kJ5
         bNSKXYjRvNUYvQ8P+7FvUOfvj/3pmy8JrQimrDyQri0KeVAGSa3ax8Mw8NIzyx9NaRHg
         56l5lxMS0u9Q36LRIpxryvSqTV/7hmZRgBfCvfQ6ue692UIWnqRtftVwxoHUhRWz0pzq
         sVc6Mdq1HLwohEjX3YqcsB2oV0yca6V7MKYF5mzv0psTT0daAETQ37UUh97ewKJ0N5IC
         Qc0De/sYbp5B4qoJlCdC3nZhy9mHszUCfxQ+yReTd4gKZI3eh0qmo+z0H2AXAO8MseGT
         UQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCX8mpTmvn9epDGaoVHTqNjMGVV+fueOd6CHflY+wFtIWBhFzfR2ukFDMucZImrnRkCiZB950CLZw/hNVjZFJ/6o@lists.infradead.org
X-Gm-Message-State: AOJu0YyCqcyf1goEESEjWEh4i047BvdbsnwCZvp/KFIsyF4sNxkLaTJ2
	CWil5gsJqG4QIGEcuh+2YFmYXsfMxiLtn1Q6hYcDipuId1tfa6m8ErgMEAw4JlpMVHaWMaVD6n7
	jBzQtO0krsLT3IyFFg5CIV6KW5Oe0WXt+UfIYA0/J/kuvu8eCz4+cB53VYMk0nGe7TExNQW5vl1
	BX
X-Gm-Gg: ATEYQzyfkWN1TYziZcXGpr06KBzkkH0v+mUd8LZZG4M9SR0+ZCVAPuYRICxaTrOjMzX
	sE6iKWLMrz6SlRY+d0EvOeGdRZ0qNWUhfv8KvJfZ99YHOPoDrvRY0ZHY+916/SVVCzx0weRbxZX
	7AeabtmqWEbspiBEmrLuw4C4DEQ5PPXoch7jauX0NbrYMqy2acIshzk41OlgTlSa8kWYMNVaj3A
	zY0gOJ8lqaetRwrwRsmurHAoHGjs0RVdeQJgIP+AwQ8JWjlQCBkOYRFJ62cFtvRmTddZZksUWCv
	mdpi4IIbCsTILDsU7GPKQtqSLPvvtv6qcKWrm5r8NN64xIQeEH3Yqlw6ZSgfDBqsoAEPXAnbX6q
	fCO7r8h6KMQ0v8B7ucTVqB8R+Q5MFzsFLciMko2lobKQ+SYxcK2w2ETJo
X-Received: by 2002:a05:600c:35c1:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-486fedb2545mr263590945e9.11.1774354472340;
        Tue, 24 Mar 2026 05:14:32 -0700 (PDT)
X-Received: by 2002:a05:600c:35c1:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-486fedb2545mr263590405e9.11.1774354471864;
        Tue, 24 Mar 2026 05:14:31 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871107eda1sm28749405e9.0.2026.03.24.05.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:14:31 -0700 (PDT)
Message-ID: <5e5706bb-0f04-4bb1-94f4-45083a3c76fd@redhat.com>
Date: Tue, 24 Mar 2026 13:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vMwN6gDJeuqBO1VXG75bjUsCC3_1hsuDIKuJPQ4C9M0_1774354472
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_051436_911382_ADF69D7A 
X-CRM114-Status: GOOD (  19.97  )
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

On 3/21/26 6:38 AM, Michal Piekos wrote:
> stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> "Failed to restore VLANs" error even when no VLAN filtering is in use.
> 
> Check presence of VLAN HW FILTER flags before stmmac_vlan_update().
> 
> Tested on Orange Pi Zero 3.
> 
> Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> This patch fixes a noisy "Failed to restore VLANs" message on platforms
> where stmmac VLAN hash ops are not implemented.
> stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> VLAN hash ops presence which results in -EINVAL. 
> ---
> Changes in v2:
> - Replace check for hash ops with check for HW FILTER flags
> - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6827c99bde8c..cfc0ce9cec9c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
>  {
>  	int ret;
>  
> -	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> +	if (!(priv->dev->features &
> +	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
>  		return 0;
>  
>  	if (priv->hw->num_vlan)
Adding Russell.

It's not obvious to me that with this change the
restore_hw_vlan_rx_fltr() and vlan_update() callback are still invoked
in all the relevant driver/features permutation.

/P


