Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3686BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4W0ec4fQDJd2xOwnuzTfcy8ZaXM1RW26O37NMjr14ds=; b=u9OdwaQAEIof2A5pjJXyCr0yMT
	pPv34J4VlGTr3tQft/q5mKDHZLnF7wAnEHZOgDBqmbrUXHMeZdrwuJSy9f3Zr7meIMcpnRymKh1um
	WHe40gCso5/uewWGn1gwOw9jR5lcooYtkbfHaGnxqJWBsXALzzeoLILIYH4j+RJ7ls2ORDY2DUTXs
	aTcBJ9yClxVLyyxJjonJlzxODunrN5Z9jb09RyNCyJ5YC0BKZmSelrslnX0RyjkXSdFbACrALN3Iw
	l1z6T9Mr37VMeL27iEcydH+NqM0//DAZmIjr9tE6J7x6uAn6HDTLxFfqvh9l3Kfd70nW+Kvs8sHa3
	yM/X3t2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaBv-00000005izx-0cUh;
	Wed, 21 Jan 2026 15:32:19 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaBt-00000005iza-0k3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 15:32:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a7bced39cfso4839445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 07:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769009536; x=1769614336; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4W0ec4fQDJd2xOwnuzTfcy8ZaXM1RW26O37NMjr14ds=;
        b=NSZJTkdbFrx+KI4btSDLiFpWEBwhsImONQXz151rXy/Y6/ny5hvUXOvnVOwFXZspTn
         H2GQRpqlbRX/nX/OEeHQRs6RY1nC0nmHG8IsVsHk78lZoG164+9lIJ9GtsND8Ke65JWf
         POrYNTUzow6uxDFLt6C9OArj+oM01USPnUuSbJzY85vaEu7zvnPBLqvO07e/4WDAE0IN
         FwGGLhb372/tMHTdJXCdHdqMwCqaWdAQDHKIdHLPjvKnOXQ3LfI4Gi8L39MkVogVowwN
         CFxBelf8q7lPOIm9TzL84Nk4E8UorI4nn3MlRP9mBYVq5OL4c/Er8r47og4x9b7vKIXm
         eqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009536; x=1769614336;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W0ec4fQDJd2xOwnuzTfcy8ZaXM1RW26O37NMjr14ds=;
        b=pedZkhbVx+oJehsadZfvPSE0zmLFugKb/6b2VSrNwaklbeCuFJL93n5dmmH1TLtWmM
         hCaYQ0cg1b4wRuM+a2K6T3krIvimvoWnCigly3puluvKGEJVGnAunP5NHt/Od12TYjk+
         UQH5Xcvko2fXS8I5QEn5VkNSLVcx6yoMHu1yQc5aEnyeqhcLYlXvWxrEzNALi3ZJkC7Y
         QUbvNZ9hivAOTJCRXu8ljmqHUJIYfzKJONe5beiVWbUHiE2bgz13pQVfHWCoPILN6eYr
         xncaUlOvbDjYV8tD/pPU0aReUEQfTbTapoJRe0KWg4zkHUQ8QEiI/CFFOQTceW8bPua8
         Niww==
X-Forwarded-Encrypted: i=1; AJvYcCWrIuKIxb/VRj4QRI/Nm3NsmWDBm9Ve3+DHIRRayVMXtSnzMMLpgAxyUWZG4T6yzwYSY/UpbeuRLCP/wIwEliZH@lists.infradead.org
X-Gm-Message-State: AOJu0YwbZP2wffnVopRUmV8KDnYr/zQoU9iwE75iK/lRBwA1Z1CykNPh
	BDiKovdtCemsaE75ZrA6tdzAgb/amKtFlnWUvGkkwdw5uF+KDruS5CpZ
X-Gm-Gg: AZuq6aKT6Q+m8STfJFAETi1c9PufSWnwVIwyj9+72GUtR8PBoYG4pFTI1Y92TZgg6KR
	9HQS8fElwltJYk117xSx1RlasFEPI8agUqa+5C9QMJYZERLDqvz4zL7+y1xWfA2c6Ca9JYDTZSJ
	K0LFbUqZCmZjHEU2hBhjtrDXFRUsEzBNdEnu7vO9SUWjY6gkEVi4cE7Lh/YWEQHv/q+pfbhfGmO
	9jpaDsa78XWldgRKeY+HxDQO9za7susJz8ky6mNj97q1bd//fsm/arDXL9Fn6RuYSD8v7l+Zxnw
	eNxAXT4uJZjZPpncx/O3AjsKI2DQAPgHWrmU7fbdKB0hMHlwjPMoIKBBHZwA23z3y5mhSfCnzCJ
	Jrt9qgV88zb0D8zp0AoTxVkWr1kH1jZ1MqlqHapHjiwnwqJyCM0C0f3qtSDnV0yLaxJcAG7a0ub
	j+rosWZHrp/Dq71L/ynsW5dTysSC62qB53aa8=
X-Received: by 2002:a17:902:ce0c:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a76b053c28mr47806965ad.40.1769009535555;
        Wed, 21 Jan 2026 07:32:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd19asm159153125ad.59.2026.01.21.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:32:15 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 21 Jan 2026 23:32:06 +0800
Subject: [PATCH] cpufreq: scmi: Fix device_node reference leak in
 scmi_cpu_domain_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-scmi-cpufreq-v1-1-b0547210feac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHXxcGkC/x3MQQqAIBBA0avErBtQE4WuEi3SpppFZkoRhHdPW
 r7F/y9kSkwZ+uaFRDdnPkKFbBvw2xRWQp6rQQllhFQSncbsd0YfryXRiUp3kzXWkNMeahUTLfz
 8x2Es5QPsgKfkYQAAAA==
X-Change-ID: 20260121-b4-scmi-cpufreq-243a7676eb4c
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769009530; l=941;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=m5l9glzlQdkTaKfNaDnN8sFdatZLvmq6941LcITDeuc=;
 b=cfXD1Y1geysfvUU65r8/VTNhJv8/QJBeT0RrlIICW84nj+GcFWUl8FvfztZPFGogJbIRG+qKI
 umusYR73874BWDNCOBLN0hBKLb15zKgVsa0K/kK8Qc8b5s84NGUZ2RF
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_073217_227177_6639A79F 
X-CRM114-Status: UNSURE (   9.72  )
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

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In scmi_cpu_domain_id(), it does not release the reference.

Fixes: e336baa4193e ("cpufreq: scmi: Prepare to move OF parsing of domain-id to cpufreq")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index e0e1756180b0..c7a3b038385b 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -101,6 +101,7 @@ static int scmi_cpu_domain_id(struct device *cpu_dev)
 			return -EINVAL;
 	}
 
+	of_node_put(domain_id.np);
 	return domain_id.args[0];
 }
 

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-b4-scmi-cpufreq-243a7676eb4c

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


