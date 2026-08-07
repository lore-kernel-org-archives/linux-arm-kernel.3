Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00105C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=; b=OrF76kcuCvkfGlh+NjTpf2Fysj
	X8DKb9BhfyLTHrj6rE2ttZledpsTU4+SDAi099Wfoy8SPZpajmbmZhZc9OeKapzP3J4H3sXJGsldO
	/zvsZU0p2SgEiCFxuqhMjoVr3pTGcekH5qz/yKM1I/ONtwyUn5xQPO3QD47qNT85/8Nx9EP3prXX/
	UXxn+CKxG4FlNXXuO8b2rBXbRvC/aKEDMHcQKan4K9ExglRRMxGgc8GTvGin3Y+QdLAtAaW6pqGxU
	2yhweNS5e53K3QEbLsOsllRMpbkv6iYHR4BDQvhfdq1RCsPoniPAFKC5D/D7zLfN5SJOtkuvmZa2L
	1Y2pQzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGae-00000007UJv-1E5Z;
	Fri, 07 Aug 2026 09:10:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGab-00000007UJ3-20v8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:10:06 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84e27035206so2413266b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093804; x=1786698604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=;
        b=OFCIhzPciys4VyZvraYfZzqqRz6jqve7lSEyFZ3BMR8GfAMect2Xu0Vy9wYzk6pW4/
         u9DpSyDSxde66BwDoym/jzBY3uDC4JVnKMgAH3BC1K/JFXX1tj+wzDHGkhMvvrFryuHz
         tS0pGWWmbCisF7wNnkpqxc7/Qd0NxPJLrjz2IzEqE4aVCEfNL8cw2vVmaWuyxVPHdgfs
         SQq1ToOvk3ipd8um1ereH0oBdU+7hXn1v3BkDM5h3cVd2yojO+Y6C4gJdpF7J1oVi5f2
         15Lo00iqqCrijgJnFFy2qyosqVnxbygySQjFgXiOt1sGPyKod+eyjSt7W5i6RZ8UHtGl
         6LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093804; x=1786698604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=;
        b=cnA2ID9SRYnCgFO6NVSpvV3e/BCzEhsSsFIEsXCxPHfcYX17vvtBdYCYGc5CVZIjsn
         Jogl3QEeAVLANCDcS4hcBVDwYezscnVXVfKi/jvTkwFHyZlCyrAMY1eDgfq4W9kKvNXM
         icKn6KkGFgApHnh3k2pOyhPS+EtKJyHFGFQaVW7QKdn7Wc2zQGRciLe6fPAsRrUJwVoX
         cEBxsK76a8aWYxpMlpz6feh38Ww5QfnxPy7ykUj5wfaybMmh4JszilVenkwH0OXlOO99
         yFT3ZK1iO3bdxLlZ687OFm/17FzX/6KEqZo88PhldPX6Ru605cUneii8uOlSBlJ6ydaA
         zEuA==
X-Forwarded-Encrypted: i=1; AHgh+RrVMUvNYNjZ+4tZq/gMKN2FdR1NbV6fUIf8RDcH/Mt597V/DCR1bglDVPBcWM4kglkohMYwhuPoM016YZOV8H3w@lists.infradead.org
X-Gm-Message-State: AOJu0YyxnRtpbvanb4O/KBIGCo5fWJ/YJ+Lar51k3y05lw7jGZcsZGPy
	pGUxiOyoBbsAquYSzzk5c+QF26YrVlVlM2OEf73kZkrDYtnWeGOzNyWj
X-Gm-Gg: AR+sD10vDy1LF3wSW7DXz+J6FnNvNkNyvuUJH5ujrNG2MvTnJMjhwn7VrZa5L9Vtz2c
	3nMi8fE3aX93GeMkxh7/5V9mz9/h5V/1yNJyHutdupES6B319GUwGc6YxYP4GyKIguW2SJsINQf
	6IK2qwSGVNBUUjLjnJrvs170LdubjqisLQs1yiRrRfzf2OAbHpMzHt3bEfo2bJ9xGgZXYrvAXiW
	wN+vKY2R4W4MPZ2u8XKxe3+HcD9Nyg7nUsykgviex2NtIZwKnvsPy1n7pSvXJ7kCjYQFsQCNBIv
	GnXwTKWLVSL/GdTiR/zLztc2M7WFdFqt3Wo/+vNj7ABl7FFYo4a/hNNlkPRcShgEJUaHu7RhKbd
	qNykZsjIBXuL0+8v39BvloNVey8M1XXh+zcU8QMikjEChAraqKMWWFVnJyDMUBxJ5X8+gD93tkh
	zi1lhHPMlNdc4QpKjWZk4q6UVEVdUWqriIhRykD46zxi7yWOoXQnaPZYqPTt+WgJF+lKrlAuRd/
	x2ZSuy6YAT0Ayr5cloqwTQZvtMesQPhU8ewrdQe+l8dMMSLKsIMfkA/oqGfcVQTT5zh7HM6BCfq
	28pa
X-Received: by 2002:a05:6a00:a116:b0:846:bc60:5bf7 with SMTP id d2e1a72fcca58-84f2dfcf7f5mr24182425b3a.6.1786093804529;
        Fri, 07 Aug 2026 02:10:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:43 +0700
Message-ID: <20260807090945.41690-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_021005_544856_F3154D57 
X-CRM114-Status: GOOD (  13.79  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..240a6d67d847 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1883,8 +1883,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
-	if (!data->console)
+	if (!data->console) {
 		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
+		if (port->wakeup_irq < 0 && port->wakeup_irq != -ENXIO) {
+			ret = port->wakeup_irq;
+			goto error;
+		}
+	}
 
 	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
 		port->rx_tx_swap = true;
-- 
2.43.0


