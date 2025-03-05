Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF26C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8yGItZGsATKQZUU1R1JXmvAiWxXb3uu7q+xzzdWEb4=; b=drXM9KFehG/94oFrkAgCvXSfZ9
	X3iF8dXPYhmAV9dbBeZrOzMsD7JndwKVhUUXdQ+xFjCJ9wFTZ+KJVSCel4Jffwl/OlsCG1JbEIuif
	D2ohDVcB8FVe9YXk6ERTw1R1k4sKMwon1CNIDpEf+O9spAinmGh3GbIdeypyD8nsJ9OzDdcVO2soe
	G9sAeh8P3GK7oLFXTIdoOKtJk36SzbdzIEfycUf35RINKFgELv+DCXc42T18moflwZ7riqaLdCdT+
	qG4iYkIuBEyt1O07DQJ88KYjktmKgoFd5RyXtk9JG4q9wpcYmItU8Puoagd5E+YH2/GrbSeTRlpoG
	L664gXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiK1-000000077za-2fOX;
	Wed, 05 Mar 2025 06:33:37 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiHI-000000077kc-2TTF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 06:30:50 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250305062243epoutp04fa57fd9d699eae4dc8474e40dc511ab1~p0-E5sEA_3064430644epoutp04c
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Mar 2025 06:22:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250305062243epoutp04fa57fd9d699eae4dc8474e40dc511ab1~p0-E5sEA_3064430644epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741155764;
	bh=U8yGItZGsATKQZUU1R1JXmvAiWxXb3uu7q+xzzdWEb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fbTLDk4HNePFFo7pz3LVY7fuI+/RQCVbDjgD0SBiN0/YngV31tusylUwXWoEpcI3w
	 tv1LZ44mTQqDUndj9zKP/qidej2YIUTqff1oe0z4pyHkZQ06CQfiToA2ZxwsR2FK+2
	 nNU5mIoATikJ/WEEqZ6QsVkB2M7tsq8IhlvQdIfE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250305062242epcas5p284ec2b4db915d4c0128f4df5a7c19888~p0-D4xagZ1779417794epcas5p2N;
	Wed,  5 Mar 2025 06:22:42 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Z72Xc0bZDz4x9Pv; Wed,  5 Mar
	2025 06:22:40 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EF.2F.19710.FADE7C76; Wed,  5 Mar 2025 15:22:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250305055908epcas5p222e192cc21512ac178543445184a2519~p0qerZhYL0089400894epcas5p2q;
	Wed,  5 Mar 2025 05:59:08 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250305055908epsmtrp275ea5e1dd4e29daf87b98efce83d9070~p0qeqcypT1599615996epsmtrp2g;
	Wed,  5 Mar 2025 05:59:08 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-59-67c7edaf3639
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	ED.AD.33707.C28E7C76; Wed,  5 Mar 2025 14:59:08 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250305055906epsmtip10bbe5c1cdd842ff29e652ec38d9da5c6~p0qc4w-qu1758417584epsmtip15;
	Wed,  5 Mar 2025 05:59:06 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com, Aakarsh Jain
	<aakarsh.jain@samsung.com>
Subject: [Patch v2] media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL
 interrupt
Date: Wed,  5 Mar 2025 11:23:08 +0530
Message-Id: <20250305055308.111300-2-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250305055308.111300-1-aakarsh.jain@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdlhTS3fD2+PpBrNcLZ7umMlqcX/xZxaL
	Q5u3slvcPLCTyeLizLssFn0vHjJbbHp8jdXi8q45bBY9G7ayWsw4v4/JYu2Ru+wWyzb9YbJY
	tPULuwOvx+I9L5k8Nq3qZPO4c20Pm8fmJfUefVtWMXp83iTncerrZ/YA9qhsm4zUxJTUIoXU
	vOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygY5UUyhJzSoFCAYnFxUr6
	djZF+aUlqQoZ+cUltkqpBSk5BSYFesWJucWleel6eaklVoYGBkamQIUJ2RmnGy8yF0yUq/h7
	YBpjA+NUqS5GTg4JAROJ7d9aWLoYuTiEBHYzSkxqeM4E4XxilLg+8RkrnLPpz1FmmJadzZeg
	qnYySjy6to8RwvnCKNF1az1QCwcHm4CuxNntOSANIgKpEq/WrQWbxCywhEli0ZFnTCAJYYEI
	iVsvnoJNZRFQlVi0bB9YnFfATmLKornsENvkJVZvOABWwylgL/F17iNmkEESAo0cEjtP3IA6
	yUXiTe9GqAZhiVfHt0DZUhKf3+1lg7CTJR4veglVnyOxfs8UFgjbXuLAlTksIEczC2hKrN+l
	DxGWlZh6ah3YPcwCfBK9v58wQcR5JXbMg7HVJObc+cEKYctIHF69lBFkjISAh8TTPXyQMJnE
	KDF50Q62CYxysxA2LGBkXMUomVpQnJuemmxaYJiXWg6PteT83E2M4ASp5bKD8cb8f3qHGJk4
	GA8xSnAwK4nwvj51PF2INyWxsiq1KD++qDQntfgQoykw/CYyS4km5wNTdF5JvKGJpYGJmZmZ
	iaWxmaGSOG/zzpZ0IYH0xJLU7NTUgtQimD4mDk6pBqZLEn0fdLQfiq8J5tuR4WAffJhxe2dx
	W7KbX9qPW2Jv+83fvW5lmlwvEsRW69HibDe/I3XmvZ9xDSvmOuU07N/8xm8B65tT5dpuOtdn
	O2t9nrhpbdD6vzcnp/4/I8n4or87aLnY7fKHZ/i+5drrzna7lbLrVeeRb091Uro63jYsa3wh
	dz3v8YSCy1+Kj5y77fN/8q3C5/NnLPfxqbJutv4tb3yjJ0Z6dznnylBtl9hE7u33BXUX/A4I
	kvh6PHfLmQeXl9z/u6fR/1jOJrZKhz37jvtqqWZrZKhFFv9R0T6kFFgzbfHjk+HRs+es22ww
	v5ZL2Ki14sTVF9yiLAGsCf8Uaj2WsMS/7Dx5cW7H2qNKLMUZiYZazEXFiQDeuAaXGQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWy7bCSnK7Oi+PpBi090hZPd8xktbi/+DOL
	xaHNW9ktbh7YyWRxceZdFou+Fw+ZLTY9vsZqcXnXHDaLng1bWS1mnN/HZLH2yF12i2Wb/jBZ
	LNr6hd2B12PxnpdMHptWdbJ53Lm2h81j85J6j74tqxg9Pm+S8zj19TN7AHsUl01Kak5mWWqR
	vl0CV8bpxovMBRPlKv4emMbYwDhVqouRk0NCwERiZ/Mlpi5GLg4hge2MEnsO7WaESMhI/G87
	xg5hC0us/PecHaLoE6PEjF+fWbsYOTjYBHQlzm7PAakREUiXmHTnKwtIDbPAOiaJnSsnsoIk
	hAXCJFav/wpmswioSixato8JxOYVsJOYsmgu1AJ5idUbDjCD2JwC9hJf5z4Cs4WAavYd6GCd
	wMi3gJFhFaNoakFxbnpucoGhXnFibnFpXrpecn7uJkZw8GoF7WBctv6v3iFGJg7GQ4wSHMxK
	IryvTx1PF+JNSaysSi3Kjy8qzUktPsQozcGiJM6rnNOZIiSQnliSmp2aWpBaBJNl4uCUamBS
	u/nN8NfKyJBXn1TfPhN+MFlIvXS/9qOqXfLt5d8jEyJbuh3vTPzxxWzLjAzR4PXabrJxpw+a
	f9CJsH0yj/H+VFW9m5YfLZx9Hu5sZWt+t3j1gYX/rqleO+azscTFd2KpzK47KYuPm3GIREfv
	lSzeVa69UILN7LDX4v/5zDEiAX1N6fFB3kdzCnMZ0iJur197SVDR+bpsjflC/bP3c1+Wx3WG
	rt7f/HFL6E1Gpvnb307+831Bs1XbhZVXfJYlOthvKOEV+hzjN/3mz5m603VW+GyudEpdpXc9
	NMRR8hSTakBDW7HIvOqK7AWcLCcY9Q4FP5c28b5rZulY3q3xd89hyZmrzPprNny/aip3ZpES
	S3FGoqEWc1FxIgCGERoyzQIAAA==
X-CMS-MailID: 20250305055908epcas5p222e192cc21512ac178543445184a2519
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305055908epcas5p222e192cc21512ac178543445184a2519
References: <20250305055308.111300-1-aakarsh.jain@samsung.com>
	<CGME20250305055908epcas5p222e192cc21512ac178543445184a2519@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_223048_939820_6A89F86F 
X-CRM114-Status: GOOD (  16.91  )
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

When output encoded buffer size provided by userspace
is insufficient with current encoding parameters, it
leads to RET_ENC_BUFFER_FULL interrupt which was not
handled in IRQ handler.

On handling of RET_ENC_BUFFER_FULL interrupt leads to
NAL_ABORT command from host to risc which in turn leads
to RET_NAL_ABORT interrupt. On receiving RET_NAL_ABORT
driver clears workbit and VB2 queues for cleaner closing
of MFC instance.

When user encounters "Call on DQBUF after unrecoverable
error", userspace should close fd and restart with larger
output encoder buffer size.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
changelog:
v1->v2
Patch link: https://patchwork.kernel.org/project/linux-media/patch/20250228065952.14375-1-aakarsh.jain@samsung.com/
Fixed build errors reported by Media CI robot.
 .../media/platform/samsung/s5p-mfc/regs-mfc-v6.h   |  1 +
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   | 14 ++++++++++++++
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |  1 +
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c      |  5 +++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h b/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
index fa49fe580e1a..075a58b50b8c 100644
--- a/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
+++ b/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
@@ -45,6 +45,7 @@
 #define S5P_FIMV_H2R_CMD_WAKEUP_V6		8
 #define S5P_FIMV_CH_LAST_FRAME_V6		9
 #define S5P_FIMV_H2R_CMD_FLUSH_V6		10
+#define S5P_FIMV_H2R_CMD_NAL_ABORT_V6		11
 /* RMVME: REALLOC used? */
 #define S5P_FIMV_CH_FRAME_START_REALLOC_V6	5
 
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 5f80931f056d..e764cab2485c 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -739,6 +739,20 @@ static irqreturn_t s5p_mfc_irq(int irq, void *priv)
 		ctx->state = MFCINST_RUNNING;
 		goto irq_cleanup_hw;
 
+	case S5P_MFC_R2H_CMD_ENC_BUFFER_FUL_RET:
+		ctx->state = MFCINST_NAL_ABORT;
+		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
+		set_work_bit(ctx);
+		WARN_ON(test_and_clear_bit(0, &dev->hw_lock) == 0);
+		s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
+		break;
+
+	case S5P_MFC_R2H_CMD_NAL_ABORT_RET:
+		ctx->state = MFCINST_ERROR;
+		s5p_mfc_cleanup_queue(&ctx->dst_queue, &ctx->vq_dst);
+		s5p_mfc_cleanup_queue(&ctx->src_queue, &ctx->vq_src);
+		goto irq_cleanup_hw;
+
 	default:
 		mfc_debug(2, "Unknown int reason\n");
 		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 3cc2a4f5c40a..86c316c1ff8f 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -141,6 +141,7 @@ enum s5p_mfc_inst_state {
 	MFCINST_RES_CHANGE_INIT,
 	MFCINST_RES_CHANGE_FLUSH,
 	MFCINST_RES_CHANGE_END,
+	MFCINST_NAL_ABORT,
 };
 
 /*
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 4cf12f33d706..356adfddcfcf 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
@@ -2229,6 +2229,11 @@ static void s5p_mfc_try_run_v6(struct s5p_mfc_dev *dev)
 		case MFCINST_HEAD_PRODUCED:
 			ret = s5p_mfc_run_init_enc_buffers(ctx);
 			break;
+		case MFCINST_NAL_ABORT:
+			mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
+			s5p_mfc_hw_call(dev->mfc_cmds, cmd_host2risc,
+					dev, S5P_FIMV_H2R_CMD_NAL_ABORT_V6, NULL);
+			break;
 		default:
 			ret = -EAGAIN;
 		}
-- 
2.17.1


