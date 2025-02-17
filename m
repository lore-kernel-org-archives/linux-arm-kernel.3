Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1635C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjqSIaqjo22M/fJ6WrzBYInBLUW49xWtc11H9nbdufw=; b=CgO/8eR2oUxJCtkAeqe3rYUSIo
	J4+DgmnF606iAELowzcKKYsS3qnWyNODoni+zLnWYSJae8D8KjKvPbpnX1RS61Rast7HBHjjQD64h
	bK9zXPb4GWg+zmAVo7tuPZIS4qp8BlnzFZVGBK6dlg9a98x0iEHWT+tzR6IILtx5a3GeFWZVg+jOX
	yuecpooOm9Jb5142F2vI0o+YyOARUz8suhwk2w61LzJxfJ27V8ep6uoz/J2+7E0JE285nLFP2v5zt
	EXeEYwG4wrkoFenQub1fDVwaNjb2ucnwmr0h3bMpAIQMkmLhUgHNtdOaP+9aZU6TReINxX4XdrzQI
	jNYHdieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyku-00000004BCz-3U3I;
	Mon, 17 Feb 2025 10:53:40 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCK-000000045LZ-2lsw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:17:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abb81285d33so280395066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787475; x=1740392275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjqSIaqjo22M/fJ6WrzBYInBLUW49xWtc11H9nbdufw=;
        b=xwcycu9ZTrHAfGD3vzLsHN/BeO3D96X6CpNclngFBNnI4giMnFH6MNsJhhY1ua55YK
         JonAXDQK+yWlV+3f16p/8bIsGtx+K5czIBkU2Fou7jzqroxC6xcqlyUWdhejJo0/g6lQ
         2bdyOKRKWI6f6/rcQ074PZ1Kt0UEXYU9N/5v3DG/HeXIqsmHYlKqReBhJpnXOXEnJyAe
         Y50+b6oyOtBXPGH8IdTUxoZRwUc9MYM8CG/1Y+wlVAP9bF5JHd02o/YANPeY5TChIvAz
         pcaCbqtOlcRO/1eCiNQGP0nPuIGBdL6o5fL/ITdId9vmL5xCyWPF42J7BEbbcM7RXyvp
         n9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787475; x=1740392275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjqSIaqjo22M/fJ6WrzBYInBLUW49xWtc11H9nbdufw=;
        b=c9qdPsopxCKHjWd2GPpxle+WbbNLMl21nja5Yvx/plV0ptfB6TqyWxXst31/hi6t+b
         6RfLJCsTWuSIymNglZzdK2FFeoZKm7xU9HKCdvx0JAsqDHzUtaMm2tfKl7YbzaL4YHzn
         fUUBUvzd0avCPQADwDh9Gw2jrdFJVFCE9ANF/GY8g418yKxC07amt+8J53AhKLfS0Zeh
         AfF71H9tUc2P1O/h0ZCgl9Xm7T1ayKi1aprAtOlYdmewcLNDGirXEd2cQZWPUYPa1lEB
         7IPxIIt+JFCy+F1TamA2E43ITqnsH1mPVdVe4uATh2ub6pvFHtoOyJGE6WV9DFh/KgxJ
         IsBg==
X-Forwarded-Encrypted: i=1; AJvYcCXdJfF/pYgl2m+PpL5fbKTMDoxqU1vt+IlaCY3Itd0v7ehqjta7BlMxPz0yhazuMcCutFun1BXgRQXX9uXCwe8e@lists.infradead.org
X-Gm-Message-State: AOJu0Yyipo5TsUeU6Tyt1kOAoFyOENTIbPVDgTrtl1OBZxKOByUqhyxF
	wKqaS1fjSL+XWLyi+TAbx3HK2Dc0U7hk9+0FRCoIby3GA/Qs298LfoZXisC0stk=
X-Gm-Gg: ASbGncvsRbUHTIeaNoNx7wCJaWk1pzIYZK06gfoUfy0LXdGdnZmTu05fZgp/4JrRGqz
	n0pkYnxWIvAHnZFSLOMYl6vczc1CczQBOW0HWOptFAKYj+Z5WnZvUid8YNWv3N8txKy1sxDvxI+
	SSdN8xrQ3T7zFfKK8cUcrbl8seh9/YLFApFP455bpX1EHz9FIzht3I6XrKg9cj+A4PT9zI1l4Zs
	J8UI/uzeOrLKCLjBvG50sL4iDmbRe5SuO9AW/+PnrudT/+IzS1vEOLwF6rN7NOamANwzCvi8a/v
	o87jA3PBynM8d4ILwmJSxRzZ
X-Google-Smtp-Source: AGHT+IFlDyIupv/Dc3O4C3y1gwzt/272w46jucKO95aSvrTTvzjMkzKCPNIWu+2421TQveFqhl50lg==
X-Received: by 2002:a17:907:26ce:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abb70de288cmr1064938866b.38.1739787474939;
        Mon, 17 Feb 2025 02:17:54 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:54 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 06/10] qcom: smem: enable smem pstore backend
Date: Mon, 17 Feb 2025 12:17:02 +0200
Message-ID: <20250217101706.2104498-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021756_696863_0106499E 
X-CRM114-Status: GOOD (  10.22  )
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

Enable smem pstore backend that registers regions into the minidump
table.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 592819701809..f4d2646fcc0b 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1236,11 +1236,21 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	ret = qcom_smem_md_init(&pdev->dev);
+	if (ret)
+		dev_info(&pdev->dev, "smem minidump backend init failed\n");
+
+	ret = qcom_register_pstore_smem(&pdev->dev);
+	if (ret)
+		dev_info(&pdev->dev, "smem pstore backend registration failed\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
+	qcom_unregister_pstore_smem();
+
 	platform_device_unregister(__smem->socinfo);
 
 	hwspin_lock_free(__smem->hwlock);
-- 
2.43.0


