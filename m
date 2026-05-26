Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BD7CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Xb91WiXPazwge7GQc97YpLKCGyGlIds3mAgEY7YBag=; b=n2yNzq5VCcsGlOX710GkwoKFSm
	xBECjmSFMxznpYaQTyOeUm3EvoV6J8DdmQcCZ+cWgwl1Mvg++g9UuOCfPx5I3tINGdTAsRi9bZDok
	CRjt7Mx3qkwGbhLnuq4zUkvdHr6diFXJ10/BnEibMDQUB/fi1/IbcaKYZvFqYGzq81DKDMD9iZyMi
	PIOOl4xGU6r4KZxFeaL6HU+GhU08Sh430/dMAzxTggTN5VhQcsc5sW19KuLC33G+MfJtLS8wTrwRq
	hhkUy5hz3ZvChbtDaxKCkocOpUoik5R0w7H3JVc/1rM0zNtaG64akDdP5JZrK+LCCk/pR7UWihzXD
	FaL6UKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpLz-00000001gnP-2Mz2;
	Tue, 26 May 2026 10:49:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpLx-00000001gmi-1bWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779792578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Xb91WiXPazwge7GQc97YpLKCGyGlIds3mAgEY7YBag=;
	b=ZN0FtFXJ707EpvevpD4F4MVJFq3N1lpJQEJcE14r2LbZWsc+F5m31heDt40GZ2IjFtp5IO
	5yQ+2iVZ64NOgLssFqRBb8UF5utS1eFgYuFbEkgFJ4+WsHEZt2oxM70atBBfuWIQpHfGuI
	P9Cyua7zJGNDr1I/nRIQt6IfbrWUbzE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-dJkHkoeLP9S1fyhxTA3ezA-1; Tue, 26 May 2026 06:49:36 -0400
X-MC-Unique: dJkHkoeLP9S1fyhxTA3ezA-1
X-Mimecast-MFC-AGG-ID: dJkHkoeLP9S1fyhxTA3ezA_1779792575
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-449dcfe8005so8227545f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 03:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792575; x=1780397375;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Xb91WiXPazwge7GQc97YpLKCGyGlIds3mAgEY7YBag=;
        b=fooHaIZvGBMNpbUbu8RclDecl5/U4JZeRJTnVOxPNw+X6072QIf8MRPvepHesgrVFc
         9qcwjiXhLhX8/5o5l9IOqm4f1FoUz8ZEZBYM92/D6arcrfgsDcZKX5sHrKyCvCPDGPqy
         z1LxxWvHgf77Da2E+W4wGySekfgbpHPSK7m5f4WG7YCQ1Nmfodbqr2fXi6bQT+F/GhkW
         +lK5GVjvJohCLvuVEY8CyDNu4Q3e2Ncv0v80bvT/PTqRhIVrcbXIrJqG3XiT/3V5qVBm
         VC7lBN9GD8ygx3yzIiRDLgJVmLwS2S7g0cNpAUdnIFd56/Ox4ZDYftz0b8p2Jk+RNKPL
         sIbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GxEKBtBaPIEGS9OFmT+uc7+BRKIZotJ4OC6E5bp3BS2JCYzOZ2HLTGcq/tPqqhq16EtC8hjD0dScD0XQkAEJQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxoTuRo/OhgyA3F3fCnsVebtoe16O8ViyeRvWEi42QPF4T5pqgR
	lp3Tx4u4Wai99fnY3Vbt2xtNogESjV3s+wm99oarhUnfcRVB+P8/sc5dwyEvrZv6QUPGqij5HpH
	HUyqo/5USLnJeOPY6siDdlfOqiCepzZBzHcGwAPwKM5f/13pcJLH/fPZ82TKORZ/e6sjntM07iH
	eC
X-Gm-Gg: Acq92OGMuiRGOu6RNzegPrugf8pU188jVZqGUh7XDijC6KeImwpt8v6kUSnv59ZMuCa
	lJadEUed2983uLodurYSqVn0eKlPseHIR7Ji3bSEeXNcfMIA2AXg7DyuU0pnzF2+ZZgdSSmCoFc
	m9QOqAeIpjpkr+FWdWrnDByKfLNtgGoIom+UCewWqQ0TQPvFynAH9kC7evHy6xaCkU1+9lBgUSA
	ojEqequMQJU4AORCDcbH71R2g9gewGDu+lcPSohaBjWPul8HAXdpHwb2uq1Waew5bfP1XAs+qdK
	lKzOJFePd+OMdqwrk+goDKh/RFr0OgyYydJlCdBNaiSMVyvpls+AJEd+84/1SmJ+wP+Sa0vYJvi
	3oBBf4Ev6kp9brZR/l2rZoDHdrGCP6rS8qjy1lgewGo1O37ePS/nRhBVU3A==
X-Received: by 2002:a05:600c:8b12:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-490519170d7mr255826125e9.24.1779792575183;
        Tue, 26 May 2026 03:49:35 -0700 (PDT)
X-Received: by 2002:a05:600c:8b12:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-490519170d7mr255825705e9.24.1779792574774;
        Tue, 26 May 2026 03:49:34 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904174a145sm148632185e9.0.2026.05.26.03.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 03:49:34 -0700 (PDT)
Message-ID: <e86545c6-d647-44c3-be72-5390a211b9d4@redhat.com>
Date: Tue, 26 May 2026 12:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: stmmac: fix RX DMA leak on TX alloc failure
To: Abid Ali <dev.taqnialabs@gmail.com>,
 devnull+dev.taqnialabs.gmail.com@kernel.org
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
References: <20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com>
 <20260523121708.564-1-dev.taqnialabs@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260523121708.564-1-dev.taqnialabs@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3-RRX8smdBTetGx3jE5TUGRw1cApXE9CLqJthyiVyyI_1779792575
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_034941_508971_9AE692DC 
X-CRM114-Status: GOOD (  19.30  )
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

On 5/23/26 2:17 PM, Abid Ali wrote:
>> 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
>> +	if (ret)
>> +		free_dma_rx_desc_resources(priv, dma_conf);
>>
>> 	return ret;
>> }
> 
> The sashiko-gemini analysis [1] flagged two issues.
> 
> 1) Double-free via XDP path:
> 
> stmmac_xdp_set_prog() ignores the return of stmmac_xdp_open(), so
> if alloc_dma_tx_desc_resources() fails inside that path,
> rx_q->buf_pool and rx_q->dma_rx are freed for Rx queues.
> 
> The interface stays UP, so a later stmmac_release() calls
> free_dma_desc_resources() on the same freed pointers.
> 
> Without this patch, the same failure path leaks RX resources
> instead. Either way the root cause seems to be stmmac_xdp_set_prog() not
> handling errors from stmmac_xdp_open().
> 
> The reported issue seems to be valid, but I'm not sure why XDP doesn't handle
> a possible error in reinit in the first place.
> 
> 2) NULL deref on partial queue alloc:
> 
> If alloc_dma_rx_desc_resources() fails for queue N,
> e.g. rx_q->page_pool = page_pool_create() fails, buf_pool is NULL.
> The cleanup free_dma_rx_desc_resources() iterates through all
> queues and will hit a NULL pointer deref in:
> 
> static void stmmac_free_rx_buffer(struct stmmac_priv *priv,
> 				  struct stmmac_rx_queue *rx_q,
> 				  int i)
> {
> 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
> 
> The same could happen without the patch, and similar risk exists for
> rx_q->buf_pool, rx_q->dma_rx, and rx_q->dma_erx which are all freed
> without guards in __free_dma_rx_desc_resources().
> 
> I can add the necessary NULL guards in __free_dma_rx_desc_resources()
> for V3 if necessary.
My take is following: even if the sashiko reported issues are
pre-existing, they are so strictly tied to this code path that it makes
sense to address all of them together (different patches in the same
series).

Also all of the above looks like 'net' material, deserving fixes tag in
each patch.

/P


