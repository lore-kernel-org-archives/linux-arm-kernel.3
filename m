Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDF7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHqWYtyFBm3eO0Y8IspbVVZ2ofwEug+k6Mqw+YANX7k=; b=1QuecxERprRmoQtahb3WuukVqb
	5VkaSP2k2RGwZmoGkYDu0JnV61SGjijWRngaYWGQ2seiKqEUPfqZpZhZZu2K13lIqK0dLZqI1iDL4
	QK6W5zUt/juuPcw3vGJ9T/AKC9SKSdhgBIvzi0NMvT/CjR2sEd3PEW9dunL37RRr+icbsvpoyjHxY
	YecMyzguEXOm6px3rtk1PPw8dmxMCiBOEBwZk9B8hqqu3SC0XtSlaCHFTqvFLxOCM6XJqmE9OSY+I
	knWdMDHrgORRhA3dx0AJv/tQVsCGke/a2JuY6Fu0VlUMHYa9HhlGd4Hrl3etk+9ASDcfovDS4SLr9
	9y8VoWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnuV-00000007w8G-1kRn;
	Sat, 22 Feb 2025 11:43:07 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnqd-00000007vX4-0cHa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:39:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-abb9c8c4e59so50065366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 03:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740224345; x=1740829145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHqWYtyFBm3eO0Y8IspbVVZ2ofwEug+k6Mqw+YANX7k=;
        b=U5FrXgKqfY/V74s9LxU13QR/xuk3vouTcQj4KpCSz9y74HHu7KEvRNdNT7/dQmk/yT
         KqUfRSkFGONy1BPMjoAFZ0kjRaZVJDnOSzhm5Cz9S0UMM+1CQZqEKqXoUULU6YrmGtZr
         pDREKl6d+CfAtMI94UDbeqKfxTrwrhLBmn7cIU7QY+GaBjQ0uVt8OtMmHWXhmjRrtmof
         eKkFXDqeMiI5ZcQJN3euaTt6SRhOVl0F43Jp3G8oTtM+PppATSRz6a3XrcQWhB/Pokau
         bBwYkbjcINGgf+ja129kUD4N5xYAAyL2kgun2vyd2x8Yo+95Q2IsQYI0r4bvifmT9nTK
         JEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224345; x=1740829145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHqWYtyFBm3eO0Y8IspbVVZ2ofwEug+k6Mqw+YANX7k=;
        b=BDH6mmMLLWhso7SLXBHIp6wQYClMCYNw+q+mS9wWElXcT/QJVK7PSvkUnBSRvWE/Fe
         ohfRgi04ZXFu1nrEYmgahUVGDp+LXfwUOvcpT3adnjIUob/rQ6IPIvI0qmYhWjiuAn7F
         qDMeBgN9VMWWt/3X8Cxjj0lNWd7hw+aGC0g6NwwvYcWZ/QwDsz627yF2MyjHfPU0iAau
         np8iX7KHm5MYe3ggQWqhjpgga9kZJUhfj6C/XA+NQUBcosHmIfUA9dNZRY4kP+dUkAtd
         wJrRy+tNbjk+uhXSt0LqzJIWkZH7Pnf0kVNU8qLP6QCI+NWZQgmh0SZVch/44fyvo70Q
         iD0w==
X-Forwarded-Encrypted: i=1; AJvYcCUDodj+/IXXfnWEYCzxCSPhn36UPgJSebxHWpK6MqhoDvbhRhygHlQja5sW63bkeRL7KM8raCzisd11eNcOiCvp@lists.infradead.org
X-Gm-Message-State: AOJu0YyHnDoerEi/fzgDU9UeiOPVhCXXJSpMdV3YBRXw67Y6e7Fiwu+p
	QPuwTI/HqjyDbLvGfxj9CnD3z7Gc4bBKdfgQ76Vtz6mnpkcVhtp+I4H/KDDvnIHqXNlZwnrim1I
	2Q+0=
X-Gm-Gg: ASbGncuExV1RgZhMsY3/+TmkoWpAZycAd6FDeFtHYwFz10YwgeNRLU52GoLePcIW1pG
	w7pcyqNjgIK4RWSPnY0zPqugDDMjAHDpFerPZN6RFub4xyKSIjg1xQZmlMqS7qvtI2zs38ncnfL
	SWs2R/RAZt2tPj2qVrtTyiUbrulEmOFozsb7uJ0wVtJFq9xF5/ORO1BLhu14KbPbVdjKysuQiq+
	5jh+L3b5cyCBaHCGpT+xysEJsZo8hAyiNYEETpLc27/2wS1ep+dhWH6cwT74G0Zj901DQPXHjY6
	RrbVPpKruw1PIZNcyigXJURKzQEj/iT/B7WTx7iHXH5cmgCp+Ygs5p4vqrC89dQAqSZgFVDVIt0
	D
X-Google-Smtp-Source: AGHT+IEADqs+izaDN1hPXMaJ1Zk4lygqEDHkwdj7DtAHH3E7GEbPdzWsvTEOd9OEw48mA+XiOWcQqA==
X-Received: by 2002:a17:907:7b8b:b0:aba:6055:9ed1 with SMTP id a640c23a62f3a-abc09a2c559mr257354566b.6.1740224344847;
        Sat, 22 Feb 2025 03:39:04 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9723a559sm1202702066b.96.2025.02.22.03.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:39:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 22 Feb 2025 12:38:57 +0100
Subject: [PATCH 1/3] coresight: catu: Constify amba_id table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-coresight-const-arm-id-v1-1-69a377cd098b@linaro.org>
References: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
In-Reply-To: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gPRrQJeVCXlOJnPHZ1jVCWa17XfTG/pp0Es1n6IQ+7w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnubdSOKHDbtPKiytMq7VNkehnIP6qq4GF/kE9O
 ziK5nlVetqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7m3UgAKCRDBN2bmhouD
 1ywXD/40O8XwA+NE+t9BlVaXPJJZpnhWfPER7p69opKPzBgBEgPhhAMecsT2PkhDojzqsxC8uEv
 fND8wAAyHimTkBXtWshKusQN7YLyY3z6zGvNnS1c8Br4nZO2SYAD5tbxNiUv0X5Do6wXrgV7lAt
 8BvwDFx+3kDbkvA9jtdt67GT+mNVIsKkf6DbOYCWL2zqa8FQDyS9TwT6D5xnpfnWh6+RjWk6uB5
 poq8pZVkt10R89YCGR5OvkmxRcZk7bPuQnOLwmyhQUkN3ML4vtSOOQlj86vF6vWuYEy8DCcy3Rd
 FFdLgzxuoHDBBAweNx156SeT96ITaLZoWR5DZ4/ea1y3Ax+B3vMpSNLs4iX5H/qpZmtoSw4QHPX
 LhGNZP5ZR2Nz5UVNJAvXJstsq9X5vHsos5ceSp0aBud4bUa8nI8vjCNzMqSk8T8RyfpAy2oDalK
 L/RvaQ9E54P9+I3uDqIfn6rIwMzUD88nZB75P672eneWgpg1g8CRPZeKB68wrzohI7AY0pL6a9/
 MjiRogVa+G7jwxVU9Uc9nN134EqYboUsSIPn1yvSvVmxgjvvqv55cXzGWgqT/X77M3RYZSaB36n
 u46TgGOmJ0RIQBxz+2bjG2+zV63MfIqrhIE6bwmK53ePMmxeJH+tyDVi8bvktYzcgvOUgDrur0r
 vrsgv7SQ7jtbtSA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_033907_189338_07E1C504 
X-CRM114-Status: GOOD (  11.40  )
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

'struct amba_id' table is not modified so can be changed to const for
more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-catu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505fb0c1b2847da94fdfd468c49c6c4..947bf6f331f92df6a2e0fa97bdf3b001c7fa9027 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -594,7 +594,7 @@ static void catu_remove(struct amba_device *adev)
 	__catu_remove(&adev->dev);
 }
 
-static struct amba_id catu_ids[] = {
+static const struct amba_id catu_ids[] = {
 	CS_AMBA_ID(0x000bb9ee),
 	{},
 };

-- 
2.43.0


