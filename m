Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72441C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFd2WA4jaSsi6eBpJft54R30VZiUHUNL0WjIOmacH+w=; b=S8sbQfSvDgd07JvQVFl3xxhiUY
	gVwt7ErG11qjIGsSCofGMY5mPoneMXqqMG7CcbRszy3c031vhGGHEW3rK7ftGbiJpta86OqfpaRrt
	qI1U+KnNPxoqKjdieLqb1lqKAAp07XT5OgueYB5vVCb9uaN8QShUVKtHVt9fecNy9Du25lTjUnxI2
	sxZz3SGtT3zgFfawhZdGlIyn4bDlmzNeBO3ybEbg8FiucRNHGvKQsDVIKNKJPtoONOo/9rNKl1JQF
	mottAsKZkfmDHYUqJm6xK0oRCZqP8S+0mapjaDZi/1tKJ8gSCMK30r7MrZ81LZJlXpVbn9p7DhCG9
	G5kLELRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNVC-00000008Kgm-1pNN;
	Wed, 25 Jun 2025 10:37:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLj-000000087Q7-28ao
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GFd2WA4jaSsi6eBpJft54R30VZiUHUNL0WjIOmacH+w=; b=q9FEFlfLJ5ISrrxMb/7CnkVhdH
	64K3slZTdgjVAxIq11+eUSLxm/G5iTvW28xTagZ0OHV29j8y6GaRLRJMh/tu9DZUwDZGZ8gVWrkye
	XdBcvOsavY9s1Uhfy6SRTV9Ip9OlfxMY/flClftBpTIUMigw/hPeYZx0vPc8/VZYc0o8uyQXCqGEj
	s3gpKedEYtu2dXw9hJwsv+ehyGdvqYSWJG4p8j3LnoS1xArtHVhlEVvePKZGyRblK7ngOyeAiZiH1
	56FwHoxYxe+NjIoDaHQqFgK9dqNmrIf5VwTij1d/egug19ZVq24/kLGgMhS9H1bw4jkUENS/BhYmg
	dPwS/E5g==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLf-00000005jLo-21Ib
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad883afdf0cso258085966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843394; x=1751448194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFd2WA4jaSsi6eBpJft54R30VZiUHUNL0WjIOmacH+w=;
        b=kjfcPGgWustZo1sZGbWwqAGMF4NuC6svK5Dr3eX0P5iV6w+SYkp2CNipPLYJsKoPYZ
         sZ+5YRP8V+XBHwxpIEIDVMhAbX8o0bpk+Bm5P5xaN8j73wLHDaabIGqQSqLCbet/gwpj
         CD3XAWqoKRkQpKqGXAPeovxwG4QGtsCySqBzk+teEci/IuGBPuTxUD7ULZS8/FxHNFsq
         7dkW8FtWenMnCRyXYQ7RMHG6ZzZJloPUV501xTxA0wJOy3OTvrUoH5gzSpjK74/yqGYk
         OQr67SVrzM5Z7nMIEIdj5/tT2PQQqRELPDKzn7qftKMsE63VLKfmIYUEXN6GBpUVFm9N
         fQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843394; x=1751448194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFd2WA4jaSsi6eBpJft54R30VZiUHUNL0WjIOmacH+w=;
        b=DCfc27PfpUVvoDor9WZXk5+FjZXZcH03Om8XEXCGYU2vLyrN4b5BOQVlDt3FRlHVwK
         jRVtLZ6BuJrODlDyTaMSx9oaZsIlQ2iWwnV679krkgLgy6SSyc7lEta/3rGqIzb9T8rx
         Ygbi9nKrZfDEVKlwcaHDDVt+atUJxwr8YiHaZgmTZtcZrg6396Z7ThTRi4r27yZlh1MF
         AI4wAmAxZ/nRY7A1919gMvqSU8ChN+9jpmy7JHiqQHHIxqTkouCYzPg15PNRthROyQNZ
         oIvSowMNTHX1KZlR4vLI7GMATPbSL0B1glhqFqSph2nJKSmK6NwbVBEb2fmLZiWGhfml
         EY4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9DLeZYCatXTA97wN1siAGPaIgmHkQfz6te+no1xX8eruO1mrAsqBWu6bDjiuPAAyW19/EZaJrK99vvwgG+oBR@lists.infradead.org
X-Gm-Message-State: AOJu0YyyVX0VqkiucNRnt6E7WZ7qg3LGiIHpOlyImFj8VSF/+9vSWJbS
	jvNnC/FrJEz+hVCBzyaDFwGLJxm0iQneZabtFJlLxq0gQNZrQ//xDXhgrysOcFNyFHQ=
X-Gm-Gg: ASbGnctDIX40hRxvS+nyxuMDLNg+gSik8HRYAyghxuk11BhtaLyWv/MT/0R4BeHiqNH
	fcWU6i3csKrXPD0zFy3N+0ANjZWOIrv4s6LwE3C7gmjcP5KVLZuVAiHDbZDKyw4KUW20wbdLeNy
	dNkOygIKb/eUgjh4p60jiQ6TNYbyci7n1p/JrLsklXoqHBKSZbGE/GWTS9nFGiokCzNzbstAzML
	o59dHDHcbnQf/FDOo8dAPi8kyN8xLI4hcS4KPd9aA3XZcn5pjWtT97YLH21cXfYVvrAFrMqjvWU
	PejuTsywPGyvdq5RavkQVO96rpP01e40H5ve4dbdIQF/4Eg1g9HtZk5Kh9t0td6ydgHZG040Htd
	guI7oEhwKUSvr0g03Fm4stLCdGDZXBNaB
X-Google-Smtp-Source: AGHT+IFjoA9LH+UlMYELvwOrDva8TbPECUBoKhrTSDmX1S6yeylMCFiLfASmbkP/9St1GzH8r2022w==
X-Received: by 2002:a17:906:6a12:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-ae0be88335cmr241931166b.20.1750843394339;
        Wed, 25 Jun 2025 02:23:14 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:01 +0200
Subject: [PATCH 06/14] dt-bindings: mailbox: qcom-ipcc: document the SM7635
 Inter-Processor Communication Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-6-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=857;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=a9FLQid58ZrqwhwDBssnIOsYiwypbHIyY+vO7BVtkJA=;
 b=M++/VIb7y2T3gKskIlMpYOFvxwe+pfbHdhyU9gVdbfRegUxNj4iL+n141nUA1eMcP60CaNCwr
 IDMwEV8uYYeB8lGGvP/UKlrX7LWLDpIcdln/9pd8d17sYlzfKKWktV/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_102319_640997_0D15CA63 
X-CRM114-Status: UNSURE (   9.79  )
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

Document the Inter-Processor Communication Controller on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f69c0ec5d19d3dd726a42d86f8a77433267fdf28..6e86ec36a82254ebd73c3067de495795c36c6bee 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -34,6 +34,7 @@ properties:
           - qcom,sdx75-ipcc
           - qcom,sm6350-ipcc
           - qcom,sm6375-ipcc
+          - qcom,sm7635-ipcc
           - qcom,sm8250-ipcc
           - qcom,sm8350-ipcc
           - qcom,sm8450-ipcc

-- 
2.50.0


