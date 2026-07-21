Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83550C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jqLDltTJbUvwEIP0udTW108q5ygNeFApM+0PrI1Yp4=; b=jy6x0W+GTQw6KH+zHH6mJ4gkbB
	/NJcFA7+XMgnVPFe9iqunPayiBtqeORc6FuVU5lL4p8ZpMH8LvkeQn76UTY6ltpb3V+nzZZlOOh8B
	8B2songZfVYIt76665jkqznoIPXXiUM56vzfknJaYkljnAuKQ9Xg/LYxFLLZhXSxdsmjct0gxw34+
	gFaLn7G+t3FGW6V6/jE3mKmhTyemQf9CcW1FuO+H/+s85qm9XRcDYdxjusqroNWx/fzSnY1Jnni5r
	YAA0wbl2oLb/Zo1mo7fOhm8xrvOcZ4gxUFwOaJPImzVx3JdGJaUIhIt7GJTReBbJULZNWfng/Slo2
	Y+sIhnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF2Q-0000000AAr9-2zdk;
	Tue, 21 Jul 2026 18:17:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF2M-0000000AApN-2BQE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:17:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954aff6088so29543845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784657868; x=1785262668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jqLDltTJbUvwEIP0udTW108q5ygNeFApM+0PrI1Yp4=;
        b=eYenvkvS5a67kHYiyFZ+Qs1MzGh6VWQUslqqXPe5GhdydbKsLfFTehuJNNYPiWtwQT
         kPi44XvAM01erRHUxGB6LJE6ZVK07s1bEuKuchrKifx1K4FpBtD2ou81WjuNYvh42tFk
         1TVEtOHSr5SZV/Vv/Vy0SGi6P7DurYpyj6CeiyxFUILnO3pQBLuCuXOclO9oARm6YSIL
         mfydGBXMy1jnW48F0A+7i5fjg9pWp2XzDk/izJdkLD/QykSI06qULSS13+ndO/8rUaQK
         Rz96Y0Bn7siNE9LFlvLfM0FfVCaxfAGXMRwuJWkBnELsXJBns2/MTW0X3S/37rJg1DmE
         yVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657868; x=1785262668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jqLDltTJbUvwEIP0udTW108q5ygNeFApM+0PrI1Yp4=;
        b=aTx1fV92ls/bOiHfHHgT8LatNpYcneerzqVgHqYQDB4vMka2xyGzfJVaCU8kswWZJo
         +oNditXeo1J+PPuzYhNHA5EgIfm5NcNVEg1LxLZlaxxsDIiA5SIvv3NiEoTNbUJYrC+W
         88o5Ktlni/GWVnqeRW9UahQp9ZG5yV66dkrS/I8YHJcYbaNdRs33qqmh/zbgDHu2E0QX
         gUgGJ9dDeaS9eujmijjTCdKAyYbVzcktxyvqUcLXWEMoRNmy40IG9xoWYE1DtHeJ+KgJ
         9MVlrKperSC/N+OdlEvBcbytnqtkRmD5M7OoIsMW+GJxbvpWUxRgntw6JfEZ0kjnILnP
         4DdA==
X-Forwarded-Encrypted: i=1; AHgh+RrGp4qD2hG3UrKf9NL1Tc9ku3NgjXrva0NeQ0InmkNJc9chXuhuWstVxtBkoUVsa/R3cXPiarDUv6ch5cQzWtJ6@lists.infradead.org
X-Gm-Message-State: AOJu0YxWuvbhuaUisOXWdZD8G5gXNkQTEpxckH8kC2Z9u9geIwIZAHgN
	9vbnBVb8qJBxx6ryOuv9xklKfzAYIXHhTUUMTf2zUNuyclqQXgz1EBHj
X-Gm-Gg: AfdE7cno91vPfdzpEnU+J+YiZOl2kYJz5BN7lMkVIz3g72TnHJMcZcxceBg+w5CPg7l
	XmrmDsruQQF/aSfQYyCTAUZz5GOKwd832PI5OaxF3xvBRRDnn36NfglHGe+SLjfbKerfx/m1Kwl
	29brqYVUNoasjEvQr4Roz2O2OLyLNY0/svudNqi7iWZRDF2LON+C7S/97Csb3dJqCKSJImhM8mq
	OcwDVbeA4DEQG4g8k2ZLUUjM4GmaAFOjoDjq9Mvy/990Akm3y1MjdEv9AKmvOKvTftCC8AS4gfB
	cjQJ7AWuADr3fUKOEdx8SoFvHOSkTm0kXiFd8KOg7GU9gdKblgvcou/8aX6GBJWBVbMToPP4Mqd
	iZf1RXLn2LchPb4R6IeVrp4jO2mSOQ8dmX6u/UPtL+hoaX9o2DemOjkyBXHnTZsvZGmL8XdBaW9
	immLXFRSMoa1q+tasSlIekBqFS11uteWi1AscTUpEpkZPSyDi/0/OmxUS+osRigw==
X-Received: by 2002:a05:600c:3515:b0:495:5b4a:53c9 with SMTP id 5b1f17b1804b1-4955b95bfbbmr117595275e9.39.1784657867969;
        Tue, 21 Jul 2026 11:17:47 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd27sm41048235f8f.28.2026.07.21.11.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:17:47 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: baohua@kernel.org
Cc: jiangwenxiaomi@gmail.com,
	dev.jain@arm.com,
	david@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH v7 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Tue, 21 Jul 2026 19:17:29 +0100
Message-ID: <20260721181729.305137-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715120813.3609949-3-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-3-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_111750_562168_08E51C0E 
X-CRM114-Status: UNSURE (   7.68  )
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

Barry, Wen - the returned span is capped at PMD_SIZE >> 1 but only
checked for CONT_PTE_SIZE alignment. In the batched vmap() path pages
are only contiguous within a naturally aligned block, so when a PMD
boundary splits a batch the next region starts mid block and the span
runs past the contiguous run - set_huge_pte_at() maps the wrong pages,
tail of the array left unmapped, no warning.

What do you think of clamping the span to the pfn physical alignment,
like 8xx does:

	while (!IS_ALIGNED(PFN_PHYS(pfn), size))
		size >>= 1;

Cheers.

