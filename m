Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379571067045
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/f8358XeMqcTwt08gbPmPnqpZegBjCDtTpDZQVf+oU=; b=fum3CQekoIwZDnK9EWSdJAnLTd
	Lto94Ec4X/4NV6nNnn4qBUhzXFRPON5qNi6l1Zh7VS4THUMkN2nqYDxbsiWbNTRvx8lCUstXQmrz2
	H7vhQMaBvbtEMpEAUuUBGzZg0qFsB8PmZTFCriiLscstMPsl9eE2iw+9wZiv23HnAy8/aqLmjQ8Xt
	KXs+u+NbjhueMp3phyUBKow5aWcDJXNchzub0sAUQ5TlPAqa4nAUJzL+4fejIP621MNc/MAgsqP84
	2UsWJ+MzanCmHUnDjDKp8xDvPspAKIhfvphSLSNUfSPp09M8H+7ZfjoJdShYcauoqgUxV8FTHUd64
	KEOHlWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iJ2-0000000ERhv-479H;
	Thu, 12 Mar 2026 15:50:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIj-0000000ERWT-3Ksq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so13543805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330616; x=1773935416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/f8358XeMqcTwt08gbPmPnqpZegBjCDtTpDZQVf+oU=;
        b=gfp1KOTM3bAYbcaauXgW0ivspeiToD10+Jc3A8rOgHDuLXhTDI0lo89t7tFaEWACGI
         rEsptfBwk9sVi461JN4mpXUn6YXRSOS9qVTAD4U2BAgMi2mLfnf5d8ewC/uy7FptXn0A
         G3b/eb0xS+HKvmWODKLC9Sb0z5NFFCvAWkgoCvfzzcEZH3WQxKISdMpxn/9uHMVW2Iof
         habc7HYh8hcVosDC/5iRT9IJg4LKmGjsISfsQBXq+ZfDqoUQv2YHkg+sETac9kUjKC/1
         +QtqxLDcCwOwFom6f7tl9tjoeIn4qZlcMAKriSgWz9yJe+jFu7CpZBZFzFvGxW+PxXDE
         mx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330616; x=1773935416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a/f8358XeMqcTwt08gbPmPnqpZegBjCDtTpDZQVf+oU=;
        b=ERMQ7connayzw8cjD814E9GcLbfXe0H/x62tgSUVRxqrPpqu+wf2e8D5bqra0qmn7+
         u38IBSpyjRsxuaT5F3baPTH44MhbuVapoE7+q72m2ST6sgsv8qnKEknbbQScFAfkTuil
         7P/+dpkb+fkIdD8G6AZPgA3mxJibcGQq+Sg2uxqavb6KWezWLD8DQ0U1fOdcFUxyqwOb
         b+2yfffOvBcjEwASgUQOcBAgsLd+pHIyzdsq3vlwO5cAYUMi8PboTYiOzXZGiI+HtXm2
         TWpeOyXJixfz7M6KJ8VZ0lIzaXixQmZL1j0BjUylL08/2snrjlAm41y8ICXIv63Top3J
         u+7w==
X-Forwarded-Encrypted: i=1; AJvYcCWmANJ0WW/Uq9KXHJ4G+HvL+dza+W7fRgI6vIrIGpBPMDqvLV/PoJ/9GBH317rEqzenAak4HRNd0dA4JJeAO0Cw@lists.infradead.org
X-Gm-Message-State: AOJu0YypypjkQ57jb/eQ2WnOLfdG343os4xM1VQo6eMQcDpNgvax+SrI
	9taFES0jMKptx1ySQAt3XIpIl6RdVIONBZjsLPEC28MUoYEG0b4v5/vLipTEu14os38=
X-Gm-Gg: ATEYQzzIwWwP1NkfRHL7oQjwCWW7SDHTTqOjdZo/LBjpNbBpCRdVma5kLDHukbqx/6Q
	+WWnYsE167clIyM8QP2sfq1xfFntyBQmV4s6RAF86p4XaQH9P4VX16tT+iciz/XLwp9gY6AtZFs
	5EiIxUnnnxCuOozJbY0reWYna7CRZZ8MjSCOxLLXGtYH9Pn8vMXfXr1kTxt3b7XVGBLbAXBFDTy
	g2tCiHrQshT6glyUbYDHqEt8HguHeamt433Lq97O0OXxCQuQqpj7/ewOhefxpT36wphrwfzhksR
	Wy+2Dj3SvA/RK6i4sLwIYTbyMllgxY9CUeQ5s3HSdclWo5HdgMUxTiVV11Y46nbrncYen4b+9dp
	8kPC/NcNqf074KppcDHos94n2xKimhl6dkdTLN+5OytO01lu12WhIEUu3X3HL7oZILr3NgWJYkT
	0TVBP7xxh1lZFMbEDThHNy
X-Received: by 2002:a05:600c:46d3:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4854b12ce6bmr113978785e9.18.1773330615796;
        Thu, 12 Mar 2026 08:50:15 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm361187835e9.2.2026.03.12.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:15 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:49:02 +0100
Subject: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=msp@baylibre.com;
 h=from:subject:message-id; bh=CbhB5KQ/eIbZFKfZzmUbhzpOi/+XnjgwaeHVx94tB9g=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND5bypN1LePRk39SmSqu+s51n9xh/ZjRVYYo01E1c8
 e3amm2NHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjARHy9GhqVGib++dapanHe1
 3Vr165X+ZLVrP9JCrtoduf35wRLR+u8M//3OKt0I0EmLeeR6IL158/bzk7RiQ68Yd3xX2MRxu4b
 tPB8A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085017_861548_4BB7EA5E 
X-CRM114-Status: UNSURE (   8.39  )
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

If memory-region is used, require memory-region-names.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 3f2425e0880f9a516ac10700a218ed035ff07d5a..775e9b3a193878349590c5036aa884617ebbcc9f 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -245,6 +245,13 @@ patternProperties:
       - resets
       - firmware-name
 
+    if:
+      required:
+        - memory-region
+    then:
+      required:
+        - memory-region-names
+
     unevaluatedProperties: false
 
 allOf:

-- 
2.53.0


