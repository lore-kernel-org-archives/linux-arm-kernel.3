Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A2C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=; b=QHF5pdlA9AathRvWKTS6ldIcjA
	P7bKJv2HcZnvbvmoXvj8rV9vG1W6Oo9ZSAd5Q7+Ku71L+apUnafoFsmz0RXKHmxzfSvG8QrtCWCDa
	fs40hCqPi1YGGO/roLfAznbJS2ebOFUXI98dQbalY+ERGlvZy4/hbq8K3RQJSMDWzb3ZjLcpWEd01
	OxVsIxiVpDNLkfL6S+NIm9M5wt3KqawhsRMzspBDVgJcs/uLKrgT8OJgUrLMimQDEBWe+brRbCJmz
	wpReP4VOBDZcx7Z0vTh6sRmKXVbYR2EzAfYT9tcY2BpNQSDBMrNjKPmVbILNbdrP3vfdjjcNs0ozJ
	OWwk1DKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdar-0000000FASs-3eAt;
	Fri, 21 Mar 2025 14:43:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdTM-0000000F8Ql-1S5P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:35:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39133f709f5so1121373f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567743; x=1743172543; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=;
        b=Gx5foGS/ytVkL09tRmYnTEbOSB/2B9nO63fDo7LaafNa/EZlDbFHZkqPfz3l/iWzQp
         NgOpE2+piuiRFK3SzPxUoc9qB7K7+Cnx3ChRC6Mhs5u+PeRXA42EmHHSIo4O2w8zAW79
         oVd7RVqDPyfwYgTbO82CzgnsE1wMXTVxHF8AGqKuVGav+fLuNC8DumHgReEnKluKL/JY
         S+UwjaiSH9Gaqtc/OGPxj8sFOW+W837GpV0IIFpEu2iA1fKnDhxJ0/wcDvOm9wCmka8+
         aK0waz0GUr6X0J9tTOeaISrwB8Vr05fOH0lGxf8diPZg0YJK7yh/GsDEIUZhZqsfFxMM
         UyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567743; x=1743172543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=;
        b=MGUK98EfQw33saZ2ZxD92W6zc6Dtx98N+xGj+MwUQfZYMUv0Wb3t6UNSChVtdF98Ya
         BTUjyMyGUbTk1z+2C15X/ZkQKyEmI9oPCYnhQ9m+JYtXL66AxPYgPhdRbVGVhnDM9NEe
         V8/l1lSmeue56HNFRKS3EKUAChBWSjUANLJfr07EO/Q1p7Lc8EAlQLBBbFEXV6gtE1HR
         wyw1nzM3sIiJOOSrz0g7vRdT1WIcVnpz1U2A2IUeL8OzzFXMm0R7KhL01Qo5iqu8r0OZ
         D++55WNtLhvppLYIwwfGw+J91akDMlMfq/NhuA4wkbYK3v5ioabtJh9Ej/eKGDzcqBsK
         O7xA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Cg6n3eNXohmd9YbT8QZfGCBHsJadIJyrW2hNRioBRMNqpy7ARw7Vd/IyB8DHkLifuJg8azlQficAhbgQg9OD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6FsT3trLdLMBXEKSxDPHpgAD8f85PT/XLkKQgBku+9IUV7u3o
	g/jhI0yIU0qbFrRCKlOMOI1+r0y5OVQxvbtjIlocQDkPilzkPmNcG3Zyzfvpm0Y=
X-Gm-Gg: ASbGncuNvFtB71/NyhBmFRJKxVv/r3i572c6ui0PM24NMxyJJvZw6+bYfC/ZR8rbMkQ
	Q2Dux53OXP5Us1zlu6HDX4L50c6c8cr90gDgjmLqnbc1AmpQqanqRELcAtmk2meOcpTbwvg8m93
	Co3KgdrPOKaKtt39Yyfwy8u6XjX6kC5wJ3Jqju3WXrn2S/kmxJyAK4bWgtKhRsQfUiyky5vg0Jt
	Ty+VatzZvAazgJ35tbsvYMoL3H5MoOVx0fYQvasUoP+aCTSWbmzs95PsQiB+x81rdh3fkJu97nK
	5gx5AB6v/kg4s5LRI1jsGEB3g+GdCmYrjcoJXYi9q/XlNh9bFA==
X-Google-Smtp-Source: AGHT+IGhlqCe2mLQ6QE1+jNsut/3HpyriKLoQPJNlU/O0xCCy9UTKeLE9FjCB0uErwEBPN5BJ/Tizg==
X-Received: by 2002:a5d:5f8c:0:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-3997f8ee934mr2979865f8f.2.1742567742643;
        Fri, 21 Mar 2025 07:35:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9957aasm2571305f8f.10.2025.03.21.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: Fix logical vs bitwise typo
Message-ID: <d323a443-4e81-4064-8563-b62274b53ef4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073544_376255_F95C9FB4 
X-CRM114-Status: GOOD (  12.01  )
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

This was supposed to be & instead of &&.

Fixes: f0317215b367 ("wifi: mt76: mt7925: add EHT control support based on the CLC data")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 63cb08f4d87c..79639be0d29a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -89,7 +89,7 @@ void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
 		}
 
 		/* Check the last one */
-		if (rule->flag && BIT(0))
+		if (rule->flag & BIT(0))
 			break;
 
 		pos += sizeof(*rule);
-- 
2.47.2


