Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F072EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oo0DktF7tOdpQ2W3kv+WO9CWOkbdtYR9cJ7Wx+vAO1A=; b=kCPuOLjaYglrTkE0wCMws9s+Zh
	gMBdZ12OtCxwvJYd03rqgQ/V5CVEOYfv1O5koM8NpcTg9+kIWRuc/hGswPVBZLa9W7VKGnHB35pQZ
	+9ApKbYpCZYIQaM05WDZmccncCIjBpkO9iNR8LF08rqk1e3nKN4MhSWn4ds+6NUJitOrqllUZ2ZFL
	CvCQF1Lgjclf0ua3uZY1tnYk6/Iu5TwKJYvmYIu2Tz2IMwCNTGTE4MhvkS/L7UX37svcs2xB+Ndn/
	qdTodOlKH6MxZH3kQV3+Gak4GRlG1Zmwsu8wgFTohiSnNzTSvXohA5TxIzsOlRNt/D+0caD/9U7l4
	ArCyIlag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiwX-00000001bKO-0XIo;
	Tue, 28 Apr 2026 13:57:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiwV-00000001bJl-06ie
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:57:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SC75Zo1625767
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oo0DktF7tOdpQ2W3kv+WO9CWOkbdtYR9cJ7
	Wx+vAO1A=; b=jh+JjlOjnehP7yhCEv1nQxDtBwvhYElbOxyhlrqiiTm+vxQo+Hk
	o1M55Q5y4rUc8C/Fv6t0eNvg71saZDGsAMb+Qy+SEryyxCuLV/8qX0dJaNqu0usJ
	QnqCsXgamh1DIDK01RrpbwAqk9oEbLVJQ5fgQUY2AG294dZiIZ3H4UONxQYoIZEg
	bVmH/VtStes/w4ofjTEZ2PJd1+Pt70v/4UZ0Ch2v1wcGEyXRUKMuwC5cBItVh9Mp
	05ArYyzyQ4TeSHe74F+Q7saszD1mYw1FTED3z4km0SSJ1V6DTwr5m/WY9u5uzGyy
	JHsrBEa+uQQ+Ti1SjWlFTGFjed2n3iutssg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsbas2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:57:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56db02d3ecbso9149763e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777384657; x=1777989457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oo0DktF7tOdpQ2W3kv+WO9CWOkbdtYR9cJ7Wx+vAO1A=;
        b=Va7+4rkX83QuwAgj60CQaSNNfywugjNTIhKimY2g7/JEnE/njtwwyn/XUxIeJAMmzy
         ptAwRaPaIMLslJELl0CjzAT4UZSDpSSrGSIV5htQGOc5PjyCWYmCT83IaEgH8VGO6zzy
         mtbgvlyR8n8YoaRlilHM42ow/RLCaijrAiMqKyvylmJRNtK1ZQQ6ePwsNKxwVyaDrMfd
         IjlXLPsaYxtqG9Z2SO4UpwtaveEMLCBuO/vRkt0/laYxWYurpJ3c4EY5W2Ml/5A4lSjN
         hSuwYoitKFkx6IGV8XI2NOunmjhCpGlSm7sGnqICv8kkx/plx+4RFRfk3OgnGsMztlXU
         n9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384657; x=1777989457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo0DktF7tOdpQ2W3kv+WO9CWOkbdtYR9cJ7Wx+vAO1A=;
        b=fNKLrFjiWmly5Hh7sC8piaypPZ8Pixq0hOACBbj7BnzSqg3tDLsFN+KXWpMw460ao0
         ofl50JKSP0XjkftP9LDRUk2Zs/v0vGrShkIXf7VNCjib2nXiZrqJhCM41YJGUQhbkizU
         S1FYiFeU/yJTxEAuv1DCbRNa0Vro13j6wB3BAh5/HPJKfA0PyeQqTjLzAs4fjhACJAFE
         NNHMXzbRaCN/TlDNe0uz/8Yn3I2ln1vDGNknnFGsmW98Dik5l7N8jvYjlDdqyovDovfW
         jVDdY/h0OEvR+mflG/vAzYtBx2t3rgPn2WxbmUVZEMxika0bpu50YYyLMFyAaR6vAzqa
         ImCA==
X-Forwarded-Encrypted: i=1; AFNElJ83zNZP9GI5kdhvMx7G9TW6MCF5elMI6fchIp/SdT7GPARcMrV4RXQ5Wceg8htiQf3T1n4gPVdD5iX0tW4cDw3n@lists.infradead.org
X-Gm-Message-State: AOJu0YwTkIlb5dnjrrcm5z1pSyWKsU4l2/r4Ty4Nczfjr8+lAaqBO5+U
	NS6gOVP65pngaQge4ax9iCkl0MSeqH12K6Inhj58aofab7541fKQVWnS/E7QFmWtuW6uG2dgVBt
	VmuKcuKqUGoMutbMkHgXnSWKmWDHQa8Yqzjfo/WA7mzRkM8254bJhNtZHJLXapwvfxlf/GHZSfy
	sptg==
X-Gm-Gg: AeBDieumSP4xmtuZ8P+yJoQ8BIxGKCRb9/OZWQihzHB7xfdYJ5pY8Al+mxt9ZY6oas4
	hbuVKuE0jAwcFlqjFvdO0IaYTxIjBM3ZsLPEoT/o2mPXDW8WHI6u5DX2yxu+M5wfEnlU7/8Kmyo
	IuGTa3JFSV+KRvXcR+Ngm28ho06rxSM8Pv6Ilqf95OMtOh5hbLkktCqNc5JbTPeus5M98PiqE/p
	HmrbuC6dR9xG2ZMOQNzTHmlE7CT0LD32JVch9xRltcd8X+lkKHJ73AYb4BmAR6PHYSUgIyjSr7U
	IzYURmeoJZwRcCnmDu5YODY1qHJoOKRvlpxZscr3/lFwBp549m+DNjwzjCf8NEBBOnckcvTlk6D
	LQG4VWqPFPYAzb8J5ua/+Exwo8qEFYbWXCRgNhJyK7Ppji2M=
X-Received: by 2002:a05:6122:8297:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-573a56a3c38mr1308083e0c.12.1777384657325;
        Tue, 28 Apr 2026 06:57:37 -0700 (PDT)
X-Received: by 2002:a05:6122:8297:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-573a56a3c38mr1308044e0c.12.1777384656712;
        Tue, 28 Apr 2026 06:57:36 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm21159425e9.5.2026.04.28.06.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:57:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH RESEND] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static
Date: Tue, 28 Apr 2026 15:57:33 +0200
Message-ID: <20260428135732.102945-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RO4sCnoLm2r3uThBagn5epHnZC4mBUTIASu5FQL7li8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8LzMqvBQ2upbfVmMpUzqapzv9PP41e9kyo4JC
 0RKps35DZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafC8zAAKCRDBN2bmhouD
 1/K6D/oCyJ69pBLJGiS4gHjfXWcSlXII5SMq5zjecWS0fI3uLa1z8XjxxBB8TiFTY7LEzLgzaVo
 FQ1fwYIyrdgGL91qtALZQs6hDr+LM0oftBdH5oO+WBl1VFeNxurq0yYhQsruq0T0YMB4jvaVVgb
 BktGMIrVImvh2cLSGJUeDwJ9Jogv2o+o8p9s7/anc8nYDPkejZLqGgirFWEdedfwDo9xZO3bApn
 76BgW6Hh8eNa8WQ48z6D+vuekiykm4U1eShWEw8h3tVFhmkyicj0NG2OMAuEEqx9pgI56F/Y5uH
 2JlQ+B1ywf69Kfihx+MxKK4ae+UCA208I/LPAtk1K0jFiDAvM61XxxUuRcT3KceECGXfGVHZE6/
 F6kOh84UHOvtfarw500eYoDYrAcHs/xggj+1IJ4vGhf7/F92rS9QcCZYix5sAZkRCW0+pDS6ZnD
 f3iywhUZjtguW/3N+lMa98PqsKViHQ2OZalt2ISwBzlrVtdQn+eW23ccuArd9sFFwq1+0EXwUOl
 t8TS21melrsAWZkT9rsQHmivxfuk5VS8ybZwk2XS5zKf3ag/hM3mdv52xwLudMnTthLx1zQQO7O
 Eda2vBZ9y5Mvrlxv0M4QJ1j2ZCrescPEF5sY9bNLhVtuJ2PhigswieuFqOj06hWaioH3n6FdUYj 7YIJvcFuyJR1org==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WduSJq_FEyad3vLs0wgg9Zd11fybj_6d
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0bcd2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=lLDweYiKzoSJucHH224A:9 a=hhpmQAJR8DioWGSBphRh:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzMiBTYWx0ZWRfX31tMkkjfigjg
 Wq6utQvhOHIs8GdFpcHN59s2KqVZFZTQTuxHzmlIApiuRqU3CqD8LYFUMn3BxrG2dhIlpDkHYLW
 /pB7o5UhQQop7+IviM0sJlg+hr7mx0lYrmls7wVnZegwXpu8Fxpp9MPQ4XFbqnjmfigXqCVm4sS
 puF/U9XPdmT+d9AVL2mv0+zscWbKospTFLt8HHmFtVl7RCpcefohVlIb0tuVo4PeTHDTh+gCC8S
 a4quQskqe9TzVuLzISd1k6ghXRgXU7Frf4lOmGaxhKZQidCbM0GSBmBXxsnIpr1Iaf01FNLWIYu
 7ZwK0fJiLhShBLBgCRQ+dmhlihm6ggwxBiLHHuZ0A/i1QIV6HV8ScpLLnFIR39fcgyBwvlUsIee
 oxgQPGj6+qM3SCQq5/QYxO5oYPg5A3tyYwQ8lcnJ9m3sSvOPzEAh2WiiUVsJBaVT3EqMTXqg7li
 R1+E5in9agivAmmsBkQ==
X-Proofpoint-ORIG-GUID: WduSJq_FEyad3vLs0wgg9Zd11fybj_6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_065739_086779_8C040D23 
X-CRM114-Status: GOOD (  14.89  )
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

File-scope 'scmi_imx_misc_ctrl_nb' is not used outside of this unit, so
make it static to silence sparse warning:

  sm-misc.c:19:23: warning: symbol 'scmi_imx_misc_ctrl_nb' was not declared. Should it be static?

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/imx/sm-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index 16b5ff833d21..ac9af824c2d4 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -16,7 +16,7 @@
 
 static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
 static struct scmi_protocol_handle *ph;
-struct notifier_block scmi_imx_misc_ctrl_nb;
+static struct notifier_block scmi_imx_misc_ctrl_nb;
 
 static const char * const rst_imx95[] = {
 	"cm33_lockup", "cm33_swreq", "cm7_lockup", "cm7_swreq", "fccu",
-- 
2.51.0


