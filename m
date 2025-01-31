Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86504C02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=; b=26CLsNVa9+IyUe++LjuFHWRvT3
	lABW/VCURQ8lRH67UBqL4p+vUrrPk64BnCvInXhyouQbDq8JJpGkpfSodL6wpZMmjKh3Gw10pE8xC
	hleUXbJTGZiwdCz8/hkwG/3ZojsLLx7Rr/q9YUdWXSvI24g5BwtspKbrJeBGCUn9k+CVFT4SlI3Xu
	BEwkvEiMCyvERfH7eJDMI/wldDcE/YPkKqxayXyHCIpQh0F+MfwZUY5HLA8wnoz7O1KnUNzJyr+Go
	VK5rOT6oR/FB0pNJsW2EvdxYxvLzA86vbbnDlfjGGwvAFTEciJXeVkdFxRcvlYAC17CSPMo9R8W4f
	YYeZu5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu9o-0000000B20Z-0pA2;
	Fri, 31 Jan 2025 16:46:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu19-0000000B0K7-2eei
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:37:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361f796586so26115695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341438; x=1738946238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
        b=AgGy2kYeymNfvPFiZqK/VcEIRKAaIM/gl5rZf420b81g7X8DxpBYdaomRPuHnkdinZ
         rNYhbdnRMGSFKCtdDXm2R3OTIgCF/uRLqxNUyg7l2s12VRO1qTSpAkn5M5SPKhbvAv0T
         DB/5L915Ey40m6J0vruwPiCHJiyG0nwTELy6oqboS6AfFWBoswvO5c7kXjC3sHmV9gaW
         267YYOKkIchHO+pN7SqRHoLTattqRcvGNFZAYNO0aYh8EFVyBXdbtPxBrZzr32FVbAo+
         dRxnUCDrUNy0wIwHyvOZwwL/PgJsPlgMqtfZ5W5rTCgEQDtw3AOy68xf4wQtZhriGTTJ
         w7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341438; x=1738946238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
        b=hjlfNqPwOPVf5+pOTGnboEXi6EfUIswFtzawQtxUMKUw2GNBU7WYC5vfii0c4YBA8h
         hw2wD/vLTXOTX6WXvATX3bhyLLBEiZLtWodt5onkftFAaaoBFwZt95iLjabkDMQyWWxk
         5gsaL8V4isnY8u4dBwn3SDI0hPWCy8Vnt4L0HWgrkw5dEyRjiUA4WS0tJtuDTHu9JXO1
         1XPS3GM+bz9Jwcr81zLkmupMRLGPkMhJh3j+obfjqlvhN0B2ASri1BMotc1PZIBoJOEu
         KCzypnabLY2FO/Pl2UexN7QvLaf/x2BpFDxeaC3hNrhqNVqM6ekRivoSuZUPnPC4ByP3
         KKnA==
X-Forwarded-Encrypted: i=1; AJvYcCXgbtcI7B67OM5b/M893BlfdonGAHQSKbimMW62VrC7JIxaXQg1ldDyiTP4HTwaWCiyWu9sXBfzjLMWEkngof/8@lists.infradead.org
X-Gm-Message-State: AOJu0YyWahPlwuDPLnEzlLgKOeWX3p+3ABoboqTv4irmsqZbnm87ksbe
	XlsHkI55hUFBjhTldTwN8PCuZQk0m9rjWzVQqUsy7cMdDEpypdtwxvvncYHYEHM=
X-Gm-Gg: ASbGncu3uJZhByYwIFOgcPtPEmfzumjP+y1gTYGs2PXw69+VMlky5oBLxEqM1VvEW64
	vV4lZbompugLHKRaN8VdpBe7FIzFrkneXqf9Bh1PZTEvvz+OLbhLIpmMf0wfWm6rwYsnEDbE5hW
	OVR73lr1mzVazwQcR/JBLm3U/k0NpjaQzqJgVtw2KNngT04XpLGh/7/OzTvnwkVeJfF6t4tATIo
	aL0H0Z8kxhgU8XJAp1azwyRs5Q0mWB3Y/t0qXDWZNENjWucboaT9fyQYVzFAXRtOGsspZuYGxHU
	5VFrmpG+u1KgNYs=
X-Google-Smtp-Source: AGHT+IEK8aXASXk07qexYhvsAde0vZ0pJEgD444D81jkJ1PplRhBIzhtI0G4gtXUjh/qBfrt6nphdA==
X-Received: by 2002:a05:600c:4ec7:b0:436:e751:e436 with SMTP id 5b1f17b1804b1-438dc40d574mr116288475e9.19.1738341437975;
        Fri, 31 Jan 2025 08:37:17 -0800 (PST)
Received: from pop-os.. ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:37:11 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Cc: quic_tingweiz@quicinc.com,
	quic_jinlmao@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 2/3] coresight: Export coresight_get_sink()
Date: Fri, 31 Jan 2025 16:36:14 +0000
Message-Id: <20250131163617.1730505-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_083719_666382_F9EDD917 
X-CRM114-Status: UNSURE (   8.27  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 253ef02fde12..f31c8477f7b7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -526,6 +526,7 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
 
 	return csdev;
 }
+EXPORT_SYMBOL_GPL(coresight_get_sink);
 
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
-- 
2.34.1


