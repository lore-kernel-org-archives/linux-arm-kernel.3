Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE8C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pVlwzrEmx32p/oFLtQxJLU3h+GY6t/2EgH6uv7p6PI=; b=tJCeRSHmfGtKKMyqnwQk6k5wRQ
	t4fEVtFn6p54UmraF+NanU7ojF+bVP9Ue/iEhaDVvBh/y6FjCUnnGFJZLWor+UPXBVqf5zZkLrMEo
	qjHV6gTVKQxwEtDuWNSyn8utcE5Xy4xqqGz5XUuwrUTXIX4iKW8+kpUxa7Uu2TzDDsl8sOgg+ZlzW
	ffrZOudpRa4rvr71bMIwjh1aL29pirx13SM7IK+uiApLLliEqbr1TjjwKQmHACTxZ41nKFLI31C5R
	1BwXmaS53KXBIqqIL3bVU01VHSAQ8eK/aCiezFYAlzOdesMwWjn9hWebhFx51wp0uoZVbp48r39q2
	qyPxgxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dNT-00000008doz-35qF;
	Wed, 09 Apr 2025 21:54:35 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cnr-00000008YaC-2lju
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 21:17:48 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so69603b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744233466; x=1744838266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pVlwzrEmx32p/oFLtQxJLU3h+GY6t/2EgH6uv7p6PI=;
        b=cL0QdZ/9QI+E5CZjseW3IfVBBhKqdVk0OUbABdHW1fyga5yIecKXvbQQDzxiy4tsbj
         mt6SeSncRfApKk5aiMcZmpxTQaCOk6XpMAzf8ugGrjUJnYxEtyLWoukF99hBUvKTmEBM
         29Cdhq5K6oOR1l7ZRQvtiY011jCghIsEEOM/15de4HkGBNURP1Qo/KoP8g7k6FnEvH+q
         bWnbgJu5BTH6RtKF5cFMjYLM7Kvl01K/NG8rd3/bW060V2S7/ziR4/JIq+/oD9QzmUYK
         /UxJTnFTRcvO9L/rSdtwK/v1Nw7EghUBlS1MDj/dX4Bb1ihkN4iKJ0ucMkNoWiHY6Hu0
         GYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233466; x=1744838266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pVlwzrEmx32p/oFLtQxJLU3h+GY6t/2EgH6uv7p6PI=;
        b=WR6kT2ftjcuqUpeZURxFgYRAdgT1IT2RuxkrHzRzR1KRN5TRYPZ2YHRbAR7TsjJ+xp
         3Nm4EymHy2RBwmfAnbL5zDBaJa0S4CRxG/4VFrhMS+HPBb8XnJmldtQoHQwdMbZrln8B
         rZBGezJQ7xiBBwFbbp9NdCBnMn5jqr6U1vHdyQzp8CIG/VWoLruqtaWlq8vPskonvyBI
         IR77/yMbRXb+65eS1LDYL8NZzBx6SVbzjqlwFG3bAgeQIvKyCD8ER1Oc2TM14ri+Ze+6
         iSp1UFWPCXaUfSEt4uoHRCs94kaXi0chnwcMLBG396YgWfbCEQzqa5NSdoKoA6RTLvdy
         /7ew==
X-Forwarded-Encrypted: i=1; AJvYcCVkqFcDiwFkiX4KAUJJDnqDC021Iuxlqt1ARWThRNj+Q78jLWVAmTb0dQpMYvR/1OVcthEeshjf5p4LcmS12QUV@lists.infradead.org
X-Gm-Message-State: AOJu0YxqO6DvlikkajwzrZ7KKNBmNQHQA2UDzipHGttQit00wVBXDeq6
	ZegHOCBLwBP0uC6OvTiWDHC58dI982dwPgg6EQIzXY+YdPSlJmey
X-Gm-Gg: ASbGncuExobTl2cdLMokjgc69bwvgtVLD6v6xMjSUPHlHESpGONezBv83ELa0sdmMui
	NMeYhvWuMWFJ+onjGSMgwlJtCByeU+Q5dgzhRjUOi0+B7LbC0zuDKzYvk0q1B5/xy23fWQ9SzML
	PXSVHUW/HkOPLHelDTMTZUOwfFYQPSoA7YyjHBpW+u0krtbpH0xx1XS70b7jYVHxSWQG6uFOP75
	S+DMJ8vGAqsaOoarqtnJx96OC1XC1BwWR7+KDi6w/0aESR3rVRKqo0ggYFQcAfTPLTIzqeoRxfY
	gKZba81JfSciG63r33arZgV18Vq2oT+fYQZGvxILxtF1gtsIDCF3wycvWVY=
X-Google-Smtp-Source: AGHT+IGmPmWoSu8tga2SfVkZJNouE0+nOCKOrGe4roKu39WWRmF9KPusYmzx3vw22zaprVmqFp/tNw==
X-Received: by 2002:a05:6a20:94c7:b0:1f3:3c5d:cd86 with SMTP id adf61e73a8af0-20169480cf3mr905809637.11.1744233466357;
        Wed, 09 Apr 2025 14:17:46 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3abffsm1475046a12.48.2025.04.09.14.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
From: Siddarth G <siddarthsgml@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Siddarth G <siddarthsgml@gmail.com>
Subject: [PATCH] staging/media/imx: fix null pointer dereference
Date: Thu, 10 Apr 2025 02:47:27 +0530
Message-ID: <20250409211727.62710-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_141747_707619_4FB5EC37 
X-CRM114-Status: GOOD (  11.29  )
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

Cppcheck warnings:

drivers/staging/media/imx/imx-media-fim.c:79:6:
error: Null pointer dereference: fi [ctunullpointer]
  if (fi->denominator == 0) {

drivers/staging/media/imx/imx-media-csi.c:795:27:
note: Calling function imx_media_fim_set_stream, 2nd argument is null
  imx_media_fim_set_stream(priv->fim, NULL, false);

drivers/staging/media/imx/imx-media-fim.c:388:3:
note: Calling function update_fim_nominal, 2nd argument is null
  update_fim_nominal(fim, fi);

drivers/staging/media/imx/imx-media-fim.c:79:6:
note: Dereferencing argument fi that is null
  if (fi->denominator == 0) {

To fix the issue, add a check to validate that the 'fi' is not
null before accessing its members.

Signed-off-by: Siddarth G <siddarthsgml@gmail.com>
---
 drivers/staging/media/imx/imx-media-fim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..25f79d0f87b9 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
 static void update_fim_nominal(struct imx_media_fim *fim,
 			       const struct v4l2_fract *fi)
 {
+	if (!fi)
+		return;
+
 	if (fi->denominator == 0) {
 		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
 		fim->enabled = false;
-- 
2.43.0


