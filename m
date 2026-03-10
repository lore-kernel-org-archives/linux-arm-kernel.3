Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECF6EB1060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=CdF2CiHK0mILvYKPoKdbdiBizt
	k5FtDLGqnwdT0Abt3LkLwKufMPuCKRE+oJwnXzTsC/X0EvXHUFdbjc9Cl2v0VYnSe3RWcaLZVgsVl
	2+KiPlcrPIp5432HbScHtX6o8zBrEVh935d5xpLRl0bwJmaQswLaLEAejArXYjkWqCN7HncBeWjnI
	Yj/ZfvGmSXH1FGgBscFWnBCsxUjW8GmqvFDYrdpsTj7z2JWppMrn5oV4hBsMNojt20qKEMe1KI6hA
	ETrJuLAsLtccuuZ+vqhwvoXCJSMRHQMgSt9Nnz0G83nZ59dxpSPQ4DIutxSH7uEC4nQbA2s54Qbuz
	HNc3GQeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGa-00000009q2J-1bc1;
	Tue, 10 Mar 2026 15:45:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGU-00000009px2-2MY4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:44:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaYrV789294
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=AiiIpaWqXpKki8Pc
	E3kqxUeNlVehTwfUf6LJcxsxWMB7siFCCcIG5f4I9yV3d5ZQnhcUJkjWnQ6ug+yZ
	tz7kdDeW4FHe4xEvYwhZwlKkolXvkubh6ia37LjVcq4zQnrp7kXI+hdI2gRdUZBb
	OLUU13nTGJYXelzoKii2PhLCul5m2sKecjvt/+iqiOmKiK24h51zOLg2ZdNeprln
	E3xzMxw6YD5zYk4qWmz4ex0JToc6tYTA0bN7qlOZugdMCWk2R2jZZP6Zxz3wEqUR
	h0SdDk022Cy+6H95diIM+F74vieQIb8Ne3a/o/ao1yskWfElX0qCHj81OHxQlS04
	e6d/ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekvknh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81ce6fdcso2555918785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157497; x=1773762297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=Cr+aAgVNU7bmo6TUksNq7puwmL0kOe4UpqF2iBETzK2cNooCNbKBbCpprlY8WE36fZ
         wa0ruQBjAsusjpvHQJvQXo9LrVpTPtTNKOjN+SV3Ciycf1reT+axd3NBMbmubbGeKToO
         sXjcj4/MiaVMhub+0avJQWMm2iMkkPeMPpVFu8pU76uF+iq6XrCVm/QyrlFx/73puiQf
         eaGfgsy6UIe1M03R8ayS8yuybjJoKJm0/jQu/5UZSrWx+qN5fTR5fnE/q3kYlPoI5k67
         bt4ylBMurbwq1qLW7iEQIpTdCjzhfsDx289fG3VmTvOf/BQp8zxMX2/0ballBKVYtkaQ
         7ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157497; x=1773762297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=OJwLjIGpObvbDXXisXtx3pwcI11B/TRjfjLtsfsZirMoR5yE092WpPEdwY8D5nH5xH
         aNZ2eoBx+6TllT5jbcETsoe4CKrB6wagXpsyemkiWuBz6ZcWYNqp5VKM3WzMAxm2hQQr
         6+VTdn5vltz2PMazDrYnt9PrnJdYTYyrKMRtUKxN2wlA5qOHKqFuMQknO38mPtREtcP9
         eG0/7xE/8PP1oBjaYyYd+sV5rojYmhoSYR5+XqWMPmRlB4I2QKpu74gQVYF3nAvuxyqw
         MpwtVCmlVZ9EGiFuyXZ/QczRVYT9+9b5W5MGQJiv2APcJ6aOfItRY6ppcloSbZqZLeJN
         6joQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhoA6U/1WPoC/+ZHwxL4nE9EIYOdksQYHtfbuK+fNSwRkREZ6RaF4qRSNztu1xPSg9uGnsm1SiADyaR/1d/3T7@lists.infradead.org
X-Gm-Message-State: AOJu0YyLicR4lgPfITG442ErGCo1a1+sq2ObFZkRt0+w6Hq7pTjS9iqn
	aBC5wC+qo+Q+zhqrR56Z0Y988YZ/zDt/cZzYOSeHALJVmL8LeLgPH50ci/bWcntDmt4BTGHgqFS
	9zMaE+Qw3d3eAY1qk2MnsZoa3wfet1x41/ecvgCedNjj9ttZ+uAgMqJZfsIXHc03yodfWWgvity
	cPXA==
X-Gm-Gg: ATEYQzwYa1TiDNqcIslgI+q+G2kGS9ECG3rFo5+Pzmfoa7YXSJ10KHHf9hs9Km2X5yx
	7mGIkkTLOozuhGkVdXzLDne5hAf9w0nyJxIrwqDa2aQFHVg3x7hwxuYr9eJYVXuFz+oSo74gr1v
	Z8O1h5xafPXAcUITdis+0+m1d2fRspVoa2HwmeJ3ImbyA8HHpPUsTrsk2gKuCgqMa0EomgwbvuW
	DkAGQ2yplP1Wpg/zInpBfak8hmzbYqKQ+M5e+wSKp9AiBKNsant4wb889cy9IMw5AjIfXb8uSMC
	KVEwpNPsr5RldUDakQphre+6atLh9nukRPj1qOUJgzh9vDRmvck9sPYlss9v1rm7foBYl+wKNds
	q5KnODBV9/RhTnyWoWuBDB8/Fh/ssDPTeGXcIxYeU/mJdOs8IiA7u
X-Received: by 2002:a05:620a:459f:b0:8cd:9231:8b54 with SMTP id af79cd13be357-8cd923194c3mr566018685a.62.1773157497144;
        Tue, 10 Mar 2026 08:44:57 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:8cd:9231:8b54 with SMTP id af79cd13be357-8cd923194c3mr566014485a.62.1773157496748;
        Tue, 10 Mar 2026 08:44:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:20 +0100
Subject: [PATCH v12 06/12] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-6-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxlQlPRGUaNldGUW96+bRTO91zN0L2uk+4lc
 p7wTjvcvw+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8ZQAKCRAFnS7L/zaE
 w1apD/908hNmtgNlCAkn+L4FvAUewZLgyKgr7/esEj6bAVtRnLpfcUCo0hBzMtaE/Hth0b7A0UR
 KA0Dw+RN2+eykOGbwnPDt05CrE8OvQoBuIb1i/eKE4U/IE/rFfrVPL8IRfThjmL5W9AeTe2Vz5n
 hINZasNUEJ+aq3aK52cswdgiA91NE/MJ/WrnnblFg20UAfGGA0d+fmSp387KVqDJzvzzHD9VERo
 NA6x/wmIGLTwTMU7X7sIUutSdcEg8CTS8fLIjY1Ulrt+XrTyl3/qUy4EWskQsicRt8hianEOzAn
 kyj6bjzdwtB44d+O0dhAZZh2qr5YuvVe9FN1Y9P3H5lENTsmMgs+nxoo3JBXZ7kKI5B1iF08HO7
 He80y17YYXV1Srm1WzCqhuD8AbVEjMyNPf/WtgHsryifrn6VAYtr+9wA0d/Zw/Hzmq0C98TNYbe
 qSprE3oj6noh1N0bocANjUNppSpEXTaFb9qGrB54FKQs3nLDFDRtrNB9Z7fg+SAgRCk88MVk271
 Ki2vA3S2jAM1lczzFC41+dR0afoCuhJiEF4oHHshQ3TRNR5CxTscGnHY3kuJUY28wv4Bs/GZ7cx
 La3R9NQJXxH6NQSFPm/MuuiMjerNZTFcDyUZggHmcRoq0O4h4ppoeR/noHkz99DeI+fXIrTPhpS
 Viyzyo4xyU5GOug==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: lkudYibjq81_X2z0afldYPYtqJ_V2Eu9
X-Proofpoint-ORIG-GUID: lkudYibjq81_X2z0afldYPYtqJ_V2Eu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfXzJH4c2LnZ6yZ
 9L/WPcqX98KpitGaDRBiwhovzd9XzeJihKm3PmBsQyVnzE6bX3NvdNVp/6k/dBjL9cBPP+kVLd2
 1wIqBPHO7oJ9QjA7TJ3qSA5szeGx8Ao6L5/eToE5a67t6DAwUkHQDOIOczkr9I704lItBFYkG7D
 GIEJcQihSOqVhHCXsLmHg8TiCTJM7h0EDbvDuBcqMcyDi6hDhW8V/dfwd/cI+/ZnCXCjf8JF163
 15RfJ1J5sdRphlI7fD5173OzFTsZGB7vXenxK7EfR2MS7oGjVCj14+eXb1O3/uPyxOA75X6OIUi
 Yipyhsjbt5+zfyxmzwYeXnTLuR7k+2UIasFJyYzfFz4VmChru76g9cc45pELBjzXBLltehO7XQZ
 d+PRBoHrH5ZHauS7QFE8ur34qgWg15B7MDxsShz6tHgxwuLYmyh58L1Ktx+UrgqEvnmJw2iRjIx
 /R9zKST70tkQ1E+VvFA==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b03c7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084458_622309_E5C38E78 
X-CRM114-Status: GOOD (  14.68  )
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


