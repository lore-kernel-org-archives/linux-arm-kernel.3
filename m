Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A784BC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 19:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UM06Ci3j9hLrq67N6k5B3BPLGpbnWIgUSj1Od+I2HbE=; b=mfXEX1xqRHESYcALk6E5XgoyA9
	xxixzQw6ExLRrFnpGczjN01VqrUPmq3mOjvdh4ncXX3u4yWvGXDefPD4g5RgceJbCp5kUTQBxRrQI
	AVM3EYDovVyPVk3jbpbCYd2a9+eVHdhl8NJYZPIf7AuB+FI2DRYm06PfxytDs9TJuE0+cdiPEI8e2
	izFjPiggHh7EIzDspfCwYIxdpQCBDZ5tneYiAFEZb19FjnVW3wshTVGxloeXGebQOeSE9T5Xa6d8X
	5fCZH1aVesTXxWi2ttPKfommeES11wlG3Wbalu7TgXgoVJefW04yf5FwrDp6amqGPMDrL8COHK+IZ
	NAINQLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Tt-00000008PfB-1hkF;
	Mon, 05 May 2025 19:28:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Rs-00000008PFE-41HJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 19:25:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so5749205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746473155; x=1747077955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM06Ci3j9hLrq67N6k5B3BPLGpbnWIgUSj1Od+I2HbE=;
        b=Kt4xnvy/BFU+BYqshYoFBUZ+4i+bpBteUBHLMtT57c0JJWUNJH9buAFUiq7Kc3+dcC
         ygjnkUEtsCqrmbkPpD+vNXgK9syxaU0MIg1WMtm0uw4G8uItbeuNdxeewhTNl3Hv0LdU
         0NpmyWoZTZ8dGBBxxY93IOskmMGTCgRK5cPmWe1JircoZc049jmGNjabeeL+gKKS86Cw
         IHU5/wQuqtGyfwSjdZjwbiFHqjH9PAbrqmnyQ0RUVqg5lS0wWaTL1Z1ssXrMax190q63
         l8fyIvJoseuW5KRHaFr4jD+rpM1V9IKHZxlLBi6+JtsQXkwfflXJUklQ/VFT16E3ekzx
         y0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746473155; x=1747077955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM06Ci3j9hLrq67N6k5B3BPLGpbnWIgUSj1Od+I2HbE=;
        b=nF6rca0c3uFzsFVktLEdBVNU6sn5aZWLjAVTGXXy4r+8Uef+1wPfgrmfWP6+Nn4OqV
         ngraJFrwl8NwK2Gm4YfocRQnsWgz8Q9jkHEOGbLa7VSl7KvHVi6EH9nH8BcIK8aB6cjJ
         mNb//H0jeAawcEu02vphh2rplKfhjllRuQNWCJbAVCNFmN+Wrl5mp9ytew1ccSpiNJUZ
         x0vlwh3M0FhtngRmsSM97ajDzx+RZlI3MQD6dkAkqEgYY1YMHp2dVIH4oaP5sEBqcXG2
         oWkE+knVUWiSRu3TzNcYjtZburj2+CdpCKl6xB+374rS2lX0iwhe1xshEkePDnoL3Srm
         2t+g==
X-Forwarded-Encrypted: i=1; AJvYcCUbU16eIowIEEY7wEsm14RGZpGogbKPD53wMcxqsh3BEjzILOmh+YdlT4pqU8xSVdoOC31KKZgxF43hPsaddcM5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2AXJrBEPrgidJHCynf4OfKDJcyAZc++mzCCbaW4sA3Vqv7mO5
	96LDbkf8zWx06lEGRbJVL1fg2QYizM0XruqBr2HgMfKxXGnRXzk5ZWyBOiDyiTg=
X-Gm-Gg: ASbGncsg3k7z4NFQxZ9sAOfhhfQr5NIYuUb1GOy1q0lVXB4GwETxW9pRFpo0i+1KPV2
	YGR8IEyylaMAguMIUTxw8yV5QGnMY/bCtZNoTEpHTiHjK1x8hxbojDnuG42lLCcjlmuT3UKPrSq
	/nkxzJTZYtJaYzhLey6bzHAqLbEZ/v8m74rEf0r4y31iXWX/YSRLHjGhE2SR66pHu3hguDrrEnj
	TC7BejLsffUGhpX1BLt6Y+8C8sRpppfMgvvbT7ovlErFMd8pZzGimdryQq88xE+s9W3mnrDxtif
	JybqWbJCkg/n2HXLHZlQaw6GR+yQPVH7n2E1dDLFPVPa/w/Aow==
X-Google-Smtp-Source: AGHT+IFi3XHJBEIqrhHB5yLjhwHOJHh6sU1xCaAtDwSKMk8A4YTOWmdKbrqZscXw+g0AJqi2Zu6Ezg==
X-Received: by 2002:a05:600c:1da8:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-441bbe25a83mr49247965e9.0.1746473154960;
        Mon, 05 May 2025 12:25:54 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm145342045e9.3.2025.05.05.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:25:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: vt8500: Include vt8500 soc driver in maintainers entry
Date: Mon,  5 May 2025 21:25:49 +0200
Message-ID: <174647309276.308425.5040927694652626362.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250504173125.104419-2-krzysztof.kozlowski@linaro.org>
References: <20250504173125.104419-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=405; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=5RtXSzXeFSuZgw0PrqV/DJqniPH8S/Ajpv/Y1KD+D10=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGRC8XG/IpZYlUJg4+Sqt6sKWn1tHi6D2j4aSz
 SEHFzip5zGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBkQvAAKCRDBN2bmhouD
 145yD/0eSJj8yuAdPL/vbUt8cGkflS7gvd8gv1UTNRqdiCllFymXkq9cSYvzM1pAFdERqMb5Qh1
 V8rO8bCqu1kYbOKZOFR14UkdftXUCjs+7FblzN9eDWWa71coPWQ7t7VbtaKpqfopGeLtdfFAE/E
 x3zsgakn+RAKfFffbcaxZe+Ie78vObWPt17c+QDJPPppKWRbwye7LTwqJUTs5Gs54pAdiUWvHiC
 2gevoQpyHV0dBJW/AdKCtOKyHhqoTSvJFy82Jo+lR1DB9p2RKSFRDlBwYfz8PyUXr9lOIolsMlV
 3MXN1+A16s9ecCeBnK7NjPBJfmhgdaKgpTkbCZonmL0x0LE1l2L0ol4m8IcNlbn1YbzF2KIoHXD
 KiovzKmiS3PGWy9FReXdJelLIARrXNxmIwayyoSrZ+LRWP1bDSpfozTVNgL/JD3d6lKQBalD51r
 HLwDJzcN7BnkJ1uR9WptRghY3MWwixsU6907UiCk2JXSRWBJ+1HKsrXeItQfOwp7NqVWSnc+VkW
 vkvlfQA0l0pdgR72QJM8LMj8mSuRsDzNxd/NvzauYtHYfBglKne82koSzwWyZ79KzzIfr29CDxH
 Ig1BU1mh10RYHcPho7wPpmJJ67X++ePMmGlqTOWnfPYdZOR+JAQCmBaTJZK9ddpMSM1K/da6zeU L+CZqLmqBdnW5zw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_122556_999651_0485B2ED 
X-CRM114-Status: UNSURE (   7.39  )
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


On Sun, 04 May 2025 19:31:26 +0200, Krzysztof Kozlowski wrote:
> Include the SoC hwinfo/soc information driver in VT8500 maintainers
> entry.
> 
> 

Applied, thanks!

[1/1] ARM: vt8500: Include vt8500 soc driver in maintainers entry
      https://git.kernel.org/krzk/linux-dt/c/47cbd5d8693d4245997a1d6f96b158c6f6d68cf7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

