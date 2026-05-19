Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C757FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25Y3YTCZIMOzZ+yX4mVdRMjdJrxXuFwJ3ZTHD7azqTY=; b=oenD381ZcrYbSYsJ4rW+EkE2lO
	Dt8Gq6EP8zBFP6OJ+KxgO/HDgRQeDnN9i4MWYnky/K23MsEh/vFcXs4TPz239pnT/1Kg5jzwfq3pB
	M4ieXccVS0vDOJ/H4a3W0WGEoQjd8hFXe3ir43wht896kbRoaikJz3EPP2gwMUFzVlM/W2nmQ7Fgg
	7sbx7jP3tPtDJSJgLBti12Eh1Z2qtHX8JWpiKRmuLUsRUvfnMro7SZ3sZpXff8DFxgcSRFBHgL7ui
	O2xk/vgVHNT90cjb7TizOyTfJQ7/aWGELtJ3GVhST0UTk3LgD+dz/XLA3HZ0YzNk40xqTji0Hbsxb
	adm+Hd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLB-00000001cKO-2tSU;
	Tue, 19 May 2026 13:18:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKL2-00000001cBK-38EN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAenJc867004
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25Y3YTCZIMOzZ+yX4mVdRMjdJrxXuFwJ3ZTHD7azqTY=; b=nUnR4W0zT4THAyDA
	BO5PEYk5i36DYPXVfbCQORPC2a1zrZ98GupBpJZPlAuucFGO1xwgnYBoENeGd23Z
	bJiXwvReW7Ka2T/bIJ3ci8V2vsf3a8Razr/6jV6H03Eupsz8ajwdjnIc6w3aW94E
	QEKoIyIoiTB+f20kRkx3cllmfRmPszNX0fuXnc5jKrts2VdJwHBn1RukFUZx2/h7
	lkmrnHKRSuUNvUTyCsFRJCu+8sjYBYr2jGXH0b1W4DqPPEvfWd/iMi9me9gOjy1j
	DRyX3uX99ztgFvqFhbnkjoYLE2T1DVZ0y+Kf1xicV9VtiRXTZsuOmfo+WsSfc2Uk
	KGeZng==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hvhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57563cc7576so2687037e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196703; x=1779801503; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25Y3YTCZIMOzZ+yX4mVdRMjdJrxXuFwJ3ZTHD7azqTY=;
        b=cMDYDJg2ul4O1Qo3+JzCSPOR3rTsIdhRf154/2bFdj/UQdmp/AZ9SGsWz65QyqsFJb
         ZQjttIJSG4fvVTzKn1d1EEhqLejtEhjbiBOkvolEnNgc6sVbDoQttq40RQpnLIYij9v9
         dK9Y9/FkrlPXjy6xerU/mVVaX7qUISd7yqe3w2xEHYZYJxRv4a6elyFFeGS0AuSanAnm
         /oJkpU6Vy9O4KHqtqnPHve4zOSLABLSBXOOmYqMvzF+mTtdbrxgMg2PF49M80zYn8PlI
         y0Y/y1i1s/Kn+awikAJ7DsH9j6gFbUOZKN5eVWe4d7U5/1NmWWeGFT12i8h/CSPFS5w4
         gkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196703; x=1779801503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25Y3YTCZIMOzZ+yX4mVdRMjdJrxXuFwJ3ZTHD7azqTY=;
        b=ZQ8XP5Bt6S8/4dk2yXECqMzhrdngv3aQC/kWwSfpATDggClOiF0+BsogE2IqZtFXaG
         MA01MQDxRBiCRS0/Xp3fyBiqUHjLdvHMXts98yuG+yFBo/U/ix2HC4JeTjD4tyUEyJav
         DeTmxctdiz3+3gKTOY/IzAUPwMrdzkHD+H0RrxFbZBN6jmrOPIoyHtd92NwzVKSkU/TS
         dKgzntxNfR/VrUkforG4JZG1ZoZQMbqkwINuVVnQvIPRPcH83Qacu5flCyr6w5yyexU7
         X6ZlG2py8J3ETM+N/hxUoEZeRoL9wc82c9J+uEeHoEOzKWI713/2u5rncTphcjrqt6M4
         O5Xg==
X-Forwarded-Encrypted: i=1; AFNElJ904bmFtghaXCSZYzgWxvl+giijJyKDxkFPf5kOHt1GO4VOaAEIM1/QAFuyisSXychURYjcbHBvEA3lgOjNeXUj@lists.infradead.org
X-Gm-Message-State: AOJu0YxS5Cd8ZtJPqkfjeHPZb28WL/LIkyIK2FSeKbfOioUFKXTaY9Xo
	Gejj/i1nA4mOGOvS+Xbau6rlm7vfOpBpTn3Hsws820QWSgfEy+a2vanamCa7s62afYjjNlio6DD
	TBGw2Ir0f8M5NldpdtKdzXXJBOhlryyNzJfMgIM3jtFR0YRpS9KKvt6gtWbyBT3ZDLpJcSHudFh
	sGKw==
X-Gm-Gg: Acq92OEzzKNu9698+ix0M+pJhPc0tzdWA/T2UDLF7RomDKNm1Qbqpg5mB2xkT8hujTn
	fCPwiMuAdXnLt8WUYrFImybhESNTDBJFX1XJ1kvV6QqXDqVyq0miSoVEd4Iide50cwQ7ZxFkKQF
	YhENx3uf3P0wmJEJqqq2vJF+R9DqTBup5FzLmIwYqne88yNvByNdnYmrymDtWWQy9ToyfFhx1aB
	209ZJdZRCqD9jft+0nqlaPmtR9/2dHB38LLJnjUDPV+yq3gZsdF+z4Ju6VWkLS/VoTQjLAV9EUJ
	GqRROhNYtmzegYJEc5zr6jf5Cx0cU92bDqwxLBtDLeQDrd6zPYrcyOdy/nAbaqk/iEhlbExsfRz
	hzSqfe5NJ8HfNithJ83FQ8zbfsJaw4oyO8OG/rTyMnhz+2OgaoOg=
X-Received: by 2002:a05:6122:e247:b0:56c:ce0b:fecd with SMTP id 71dfb90a1353d-5760c09441bmr9346595e0c.12.1779196703146;
        Tue, 19 May 2026 06:18:23 -0700 (PDT)
X-Received: by 2002:a05:6122:e247:b0:56c:ce0b:fecd with SMTP id 71dfb90a1353d-5760c09441bmr9346525e0c.12.1779196702531;
        Tue, 19 May 2026 06:18:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:49 +0200
Subject: [PATCH v17 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-7-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5ItlPbuBhP65nUTpXCo9dRl8GJjRN3Zgl/exx3Ev5Lc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMI2QVh4QfndgsCdNJD5n4VcvO8wt8Q5d+K/
 ZH44cIVyrCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCAAKCRAFnS7L/zaE
 w7SCD/4naK6qeLv2LqSaYlys+AC2IFPuiySUYpicSD14elbykLxS88aNE36/HjJDfx2KdgTGz2E
 6lDBGA02ogSf8A4sS02QdH39yDnTbC2VmgGbksHM7AysDFjO+oeKyayaE5ouP6zqjLUqYgD27Py
 x+c6BVd7KOsHWvLXGFWqBw3uz76d769SzY71UOkdLG349OLlqXANFldeuBs+YHoNao8cFvu4rCM
 4QOwsctgpNtl2mBSL2dP6TQasIBVn35viGQgC1JR6GuDo6nV/1gasDUumnZT6gy/dA/vPbcTkPq
 RtltJxBhOWYX51fF5oHbJDQ1HDHGyq4eMzKbEACEPx3JvJIvo1HJ3xhfa21JFKemU0EqhKW92pX
 ao2iuSFx84uqCIHUAjYBsg++6WdkxeMmnsqL15nxvFhm/esX+gC9zo32q7MhweFuE5LkAZlSdfz
 OSw8pLIsXi4SBvnU05aOt9TogVAKm/1LO+GSH4PNvyrWNjb7jpGpslYy/Y29bK/mls72DZY1HPo
 Ct+K2s9AFrKoX4hwE+SJDRt2ypAWlx4mkEwauNq4/8I4ikevdgQSvT6vXb259DAQMSjM/GAuVI+
 R1m68oimVXXb9U9tkbJC445i/80bOCPcc69OGI/4yc6wcjQwyQYz8JP9t5cQjraEqr1lIaMiS1C
 C5UV0W5yxOvAVBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXyGxbiGK2ciSR
 37h2qqpyk3WIPpBoWFdMwwYLS/y1qhiq/ZNIhFSgs8flzJ7G+QK6HAbT/wZi7rpKQrGYThzms+l
 /c4e3g0ma16Jn5XvEbGiGpTS4Tleek3q2RDSuVhzRqhosKDcnhAZSG90EGki1ZuwrsK0fbenynF
 P2ATb3qv7ewOUTPT2SqDzwRgkpIg84jg3ThAo97/u/bo7IyISc9YKH934uXxyklAkeyYC4MIPdz
 72IalV7eL2g5CEGEC8hHuMpmyZ7Nk0XP34bbZ9L/14pQs3G3l9ITJT8isgdRRDD9ZI0oZnJZEjO
 Vtb0BCDC2/paszVTUtvT7eaFGP2sN+8xzDUBdFjdSjt35sCQSmb11gEIX/+9Xh551GC+uqWgRd5
 exfYV/Pw6nead8nvPTqNop0lYBz/MiyTw/770nLWSe8olohJpyhLPaPetlgiXX4gzfGOqmDaUPs
 EIz2e3Dq8LqmxTuJRrw==
X-Proofpoint-GUID: 8cnDAeHtggxq8krfYBcM3iaQuwyU6CXm
X-Proofpoint-ORIG-GUID: 8cnDAeHtggxq8krfYBcM3iaQuwyU6CXm
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c631f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=Jr3KVaxKR4ukTOMpvgYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061824_908871_90410712 
X-CRM114-Status: GOOD (  16.05  )
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

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..e82fc862c74b20c34ea5abd6c0b98b71089a3fee 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -186,6 +186,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -240,6 +247,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 		return ret;
 
 	INIT_WORK(&qce->done_work, qce_req_done_work);
+
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;

-- 
2.47.3


