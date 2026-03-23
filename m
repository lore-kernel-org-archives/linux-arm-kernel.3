Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33D0F4613F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=Hn4Tessa7MznXkBVN/khmLoiqj
	aygFiD4OwPXAhx42ilbCxJDgxapHwJdsO/GYINxAeQWZQ9e8QNe0gBp6mGmAbf+7ImRnlkKPSShlM
	z58l42vXz33ZiQ7ldyc6bBEXFQ+pLIY+UCvuw9ibXmYN3+ohsGJY2HiZNX2Dk4oVdKHbA9x+3a6vB
	IxemkjG7AizKsyXKaVthkZuoPbK+3vqgYmN1aTvEvJKCTZuBdHUhKN4ekicA/9dgF8H2CCBVczorT
	GyIwaIaxYQ3b2pK39p2JC+zrMXHfwJ8POgF++HPUDPYUrcs8NWCL2jbS4xwMOfsN3lH07XxrIXPnR
	vpbZFERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2Q-0000000H0CB-39rr;
	Mon, 23 Mar 2026 15:17:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2E-0000000H04J-2fJ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGSjD2827954
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=pa+3xmrYIo39UDIg
	YLcBiQ4lG5KDMC6Ply1GiYnsIn6X2qjP7K0CpJjtUWT/5ItlObDcONIXXt87lS9E
	GZBKDOPlcWhPbJhqixzJbg+m93+kJFA2CzQjB6P0zMTuh8GbCVQF8Z4WKTv5jH0U
	4wHLO5rl0QBl0ojaGoKZUWWvuVFWWqZl9qWfU0G6huxwd2jOpIiHCn30tMx2FuUE
	ZnKRXkPChYu4bi9ka/0L66JW0iN1n5DfMRLG/sQc4tH5FcRnxrL0t4pZTicHNItv
	x8GG9/1c01QXAbd4Gjp3kUSgVviCRqdscyw2g/UQsQxgqWu15AdsKsPUb8lxiMqA
	9/rDpA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20jva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56b772e53d3so26734237e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279061; x=1774883861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=QmAo1h/mOxiadQl2twoJ2pCjG2gG5FXEcM7YRu6RaKMDoA0sqL1JpszeJHG9/RqwPa
         7vAmYxXRCv1fbbCfMUylZENy6en2KHpQY7gtUd8QB8J1MVQauzMOrgKPjW0vjnOvA5NR
         xtmqF+iAKyQd5A9dDWcbbryBwDmVdtXqQ+YkJ+ZU0XBSRpstUp2kvEzJupDXFX1swgy4
         /FvcE4GYriuxnKouXD9HlbmMwnT+7B0Kgni5vLMYg7FAeDoTgQ0owVwf5iDiCuVwt/cE
         j20Vn2C8JL8W5LVXjkqdV1lChcuQSKVuwVJk9L5SW/qUC1a4ZCq4L6nfFB8Bmy8NGw02
         QeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279061; x=1774883861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=fgF9a/IsfrHw0qYtLiDUBYcfwhJ5j4by0wBPECsUx8plEVwT4zT5UCcw6RenC6LONL
         Qy+X+m4QSnoALj7hru47b950+lfJllDwDSBOH+NstIXJsVKm+cvJrv4RhSctPkfSzINv
         SsQhE2FKGmwFVbRp4SxWMptPZHN1WiF22lXtLfOIAqHxKR8pVoWnl0Lc7ilqhq5YRuR6
         GdTMddOU1z/EEY0MNzfJV2J3V4oJce55gq/+IGblT3F8yZ0jLMGPUM0Y864up+m1bmQ7
         MSqo03kz1db82N11H4sIx0WFapyZsa9CwR/vLd53p1dwQKb34oZd94e8CilDh2TeRFSJ
         lkCw==
X-Forwarded-Encrypted: i=1; AJvYcCXk9aUqAGKaanvBqIZlaBoMbXeTSKHnqUT5t29ZH2IJffSscfjH39eO1uqyRslj4fN5o0A9qZdDKBA1CIigBUWt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ZqdcD4/rf/jxzj36etPl3I9q3Qshxlxy2SKg3XRhEz3eddCU
	DRwRCt9UBIml9KzTPbIq3EHeyqJc7FxY+t8KVio+P5BKBlWU0geziRj6x0Szyq8A6alk0CxwRM8
	/whOvuTyyo+wq7KIhGsjGeKH1n1act7TrWLiVVSDK3Pj1ZyAcQcad/ls0cEVYQF7F+14c9955DR
	um2g==
X-Gm-Gg: ATEYQzwK75mQ05iIh9twFoVh023oR2Wz7p1h1B7Yqr4o3/0VPoWl0ehixwq8oHD5wn8
	AEawrPs4ZBks279OqEqmjnrL4Aec36ZL6XuQctGM0r7EjUiOrP9xqJd9G1BFAtsdUN7EmF+ymFa
	l2Fwv0YbT2QAX/WlyiBZRxKZxE94qfkreHnNp4agqHNgnJ/E/oGuYMRkwPmftolcJMynlXCJiRj
	vjA7weoMokGQOY8sOMv5pc429jZ4K1f8UbTzzbs73y053Hhk/pBvqQMsnAwxlgw8nQtCKfFPIO3
	uh/jsmYS7NsPSpodxhcdKC4mUZoPk5XGBstmcxHRWMoxJcNtD5oN3ZOgQTpl0y6BXehoeG2X82C
	19U1AUuKQdp6o2+csNyiDXFQ7hSQDiN2ne8bCAKieiZEzeP+8bQo2
X-Received: by 2002:a05:6122:8c24:b0:56a:f34d:f225 with SMTP id 71dfb90a1353d-56cde3fb2e1mr6327691e0c.11.1774279061018;
        Mon, 23 Mar 2026 08:17:41 -0700 (PDT)
X-Received: by 2002:a05:6122:8c24:b0:56a:f34d:f225 with SMTP id 71dfb90a1353d-56cde3fb2e1mr6327634e0c.11.1774279060589;
        Mon, 23 Mar 2026 08:17:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:12 +0100
Subject: [PATCH v14 06/12] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-6-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmAhu8moplJ8pqXHH4fRnifztUVhJgIpoChw
 kDtIV7AXb2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZgAAKCRAFnS7L/zaE
 w0AeEACXfpNMwOBQHUkchG/Va8chbPZrXTY4ipRIK/aTbAWlxOQ2Ml7MmhfkppYmbI0hHBwF0QG
 9J+852i2qW02O8aKYUnxOwuTC+fLIY2U0HA8cSyeKCmyLJQDaeDdYwK+++aKJeSEiFywL6IciQ+
 iSA36P0m71JcKImO7/VckqewAKtw3r3uOKZTCagqfP/hlci9AaKW9r2MADqyAG+n3i3/vQ437b2
 nhU05VqpsCf58iDutx/z1uHGaBkP17ZPKIdOJg8FZUAT/b48xysNigp64CxcE3VZ5EJBSTKqkOt
 XhJLH+6TYbnSvHsCh5t4WY58EEQz6nVqSWI6VdSoOX4b3khVf95g9k9N2Kw3xSVtAoZiET5l5eB
 esPCo93MpEjJUjErK1cNMh7SIoPjj+kCqIrF3oE7LX7s0BAup2XGXGEB7naAQayD6Ap9EnUON2S
 ET2p/BO5DC7dWfWJlsmOV7/fZGVz30aVLDU0USWklTPzh1nd9ChJJCgtO8FJZzd0xgFMkE3c1VK
 8oH59LhVz6GsK2XZKkVblxwlafShxJU+qglU42SlIKpdIuzZ5t58y3OfcQDTgeK28ZXVaUcWl7g
 zlb2gQduJvKUWgTvt/mOESR6A0noJ4HKv4YFktEF3dK4RcvOEzH4LgkMy0oAZrf95F11N/23xEA
 RCjHrU7a7oekk8g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c15995 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4ZVZkcpRjoszOZvKIg3qspAOuAcWlHEF
X-Proofpoint-ORIG-GUID: 4ZVZkcpRjoszOZvKIg3qspAOuAcWlHEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX5STSh710TJcN
 nUTK1Pp4YfzJP+QLJY5h4j8O7roI3W1d8OTUhQDgvrVzm9FedZ+mlIVLruwcIhvD5agT9jkbUGe
 LeAt1ApBI2pQ+fvbthAewMEso4KW8GRrBUSTonC+kuPBJbEnzN+Ew1luiRYs3Bc0FCvlGixjANi
 JXqDtl+dJuqgWNcz1nKeaal9hmAi5OfJjKk6N1lEu0EQcGir0dXRFMVsHBPz09K1zHw8n4pZGWB
 spSRMZ6DJejKmnMDGG6TqmD2R1wcWsX+Zb5f0TIfdPgGSiBPdE6uiaZunUsk4VEggz+qimOeHtP
 cDhwMwV1WkZla/QoBaKiuFuKFmiouMs47+PHkw37xf6SWDkO28wFbalyyXbdnOgifSf2Bnqtwc8
 Gu+2s0OiA9N5XgF2yR8byxp/2cm7WANIN1JmXFu1iorsLn8IUaIzABmD/t+9WfcL5WjBWpNUvtI
 xrdo/EqnuDshgg/KtiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081742_813089_514B8459 
X-CRM114-Status: GOOD (  15.28  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


