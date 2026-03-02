Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6DFEA4E2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=; b=JAGx9mOTbMaGvb9HfAXD0/snNN
	m/+URDP36HHOelE56I7OaSmSD/k/WhM0SQ4ub5lI5m5RPODZ+zSJHTvVpaYjTpLj/JXiVDezU0Pzg
	6d8/3OFp9b/OCl9F2nz1q0Nk1/L0/ooRDMSMrRaBQgbyR5pMvpTVlmhZ0r6lV2U107rQ5bSc9N1Gn
	6/aVhToUuv6SJviqVfr0fT1f/S4eqiR/W2Z+VKfWr56ieSnoSpla9D5b0ljhASF25AmjbYjlpDprd
	1V6elLrETWTnIiKNmRgy0qmXF1JrEXEC3SsNnB/uiOXEbJX+laFcrMxrFNgpvm2nuDpewHnXeB5Ba
	Od4sbplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5er-0000000DQNs-2uWZ;
	Mon, 02 Mar 2026 15:58:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eo-0000000DQHL-0TlH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=; b=H18YDXtMVtFN4fs3tKb61F3GPK
	WnJ9YTIjzZxQ40lGnd91dB604zDbKYoKvyFW7SUVQpXZzz/jg1p+2f8au5Fselq/NPkDdHwwvzvSe
	BVWRxLvoGqjYKeP6njzBEHDHj5/p74iywjXs2K9tx3XQFAaqQEBvwPRP1mGJrfZHj55rX7s2b6PXD
	EgyJqi7ZAh+ICW5fJI41w6S9TNCT2mNL7lmDjqnyJkwv6CDgBNH12kXk9dwBG6XDAlUua8GQXW6YI
	xg3Z+98N5/nkXfp8ywZuagQmmVjoE27s8eKzmLnl5b5H5jGJjbS1Uo60STNOuPwhGdXexjXt/sJyg
	pVXD1tEQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ek-00000000VEI-3Gkj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:58:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ElvRX2048956
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=; b=ii+o15pJA0ObdYt3
	nGfXs1wAil3n4EBCqhUko6dV5l0WXWS9DsGA+IP3l7zkNx9RRI4+6J5OH2RzJV6i
	qQYP5hNh0i3xWwtSnUwHV5uO4K3igZc30yF1/JKM8P4jJrlZVgUBwfFJ5J8Z+jOG
	TlX1Ao3gc/YS5XnSKhcDon5svWi1KeUpUKCMYhznFYgBjm6RS3FnkSqfuDd1CFpt
	nCfjNHDwx80Kj4qul4aSPTkB0Xe3vron3l7GiaBppDPBzOJF37qLuQMgS9ffsWZT
	pPnm2JXAu29qSr8ftw1n8jGyHwjyps58l7jUQI32hTxQaxLFxCHCw+KZTz9e/9RK
	HQQLrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfrakf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:58:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70fadd9a3so4608125785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467080; x=1773071880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=;
        b=eKsDXm89jgp9fDCs2SAyUtCYvssJlkYIc4PBQ3QgHcgSTi6v7bul78nFCpbLzbAeK1
         ly5NwPRhIVb8FZgXSfdJ39PdGtBk+vmyfCp7XfCqY8WdR0wDQALQn8my6HdM4y7MKK3G
         ntJIJhB1kCDj66XrRo6zDDXoD6GHpxc+s28vZlGslzrYuTI2vEpV4bnWlURp9kpE+/FA
         jiZkZX/4TS9c48tNc1vbT57vaXdb7C3A5u9Hq705W+l0GIDI3OBS1/fQY1pKsvBAcFho
         aFoRWN05YIW7KVfjzpbFttDNA6CrmjZF79QhYM5lKTgga8YtOA3LnsRBG0C/YMlN2wkh
         HJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467080; x=1773071880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=;
        b=lKCPifH24tk6+N9tyH3j2b0fxaMB71t2pKE+986jhJ23ymczPfYi5b0gAPICcPCLwq
         GyojCImlGyvwj8s3q7V+Hl8jP38knN/y0zw2D8xNO0LK2mhsQcZC75fItOucJlNKaEED
         5Io+eTV/Hr1Oh2v/Ez1hjDWVFCOqE3Zr5jsrkHx0V33WOHQJy/XuNiXbzUoZBhryEpXi
         ZuXnrhNAlbE3TNdjGmHJAKq2CNN1sFkhMoKPhvJyXGTN41LNkxBVKuv9xMO8ZJnZ3Iiq
         fa5YlOJBbPFN6O8HX/dvlw34mPqqDbiEfwSWHS5PGIILedmhwMNxc9wTT8ZVjwpCYo+F
         Bi9w==
X-Forwarded-Encrypted: i=1; AJvYcCUYfTHdGUXHmBrfG/zcQupfMDaWMX41xqaG7ENmVvguzIQWSGCkYV1WvknbdPI1ycUEIpWkYwUPWXvL2bD/tRSa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw78TC3mIEY604UKhE0d6eiCXldCZTdsh/ZymSSuAs80mPeYfun
	tSJsXe0D/F5gC8+fx7klDCMe9R3K/BhqoGiSozPtT5bt7BYeeOeFZ4Gdo8k2vpGSpep/Px7Ecxd
	JrMf1YT/MUjA2d2vCC6lJ4EOwCpfibf12XxE/JE6IqESeXBxObfwoWOmCVKVOFAK8nxZiiNqK4N
	ixdA==
X-Gm-Gg: ATEYQzzN9tCgE2lS2/BXvSRoedPjjrg0oorswjsHzl/T/kG0w0WEY/0wm+z5B7NbwfX
	3h7kGyLDRGX6ZBP9fK7m8dn3TLuhM46rrx8gCnkK9EqAn3Uid+dnedWxbx63ZATybLgGiAZlmzB
	1Uqs0VB9XQkSp2HouxN3zsl7HPG02ESG6VaAsPBWfQ32ZknbvdYgexlkyDFRQpnHNEgJ/BEUh21
	oVxaMuvkNN4AFTfzQQPzJBOwCU92CACN0RFMLEgQOYrSd1vSYvjFMzBPdZVRU2PiamUuFLbWKqV
	b0s5sqqRBwNx/wJtei0K82uY2zFxUXLXW+j1B5Jb005jh4RHjtS24rYh4+eI3dfRXJ78EDHx40+
	FF1r+beesy3QeKqv0KnemS9CcTd0ZBL0ni1j4516+pgTx7fMiiFgz
X-Received: by 2002:a05:620a:7118:b0:8cb:4059:a90d with SMTP id af79cd13be357-8cbc8e50bf3mr1568264085a.38.1772467080489;
        Mon, 02 Mar 2026 07:58:00 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:8cb:4059:a90d with SMTP id af79cd13be357-8cbc8e50bf3mr1568258085a.38.1772467079863;
        Mon, 02 Mar 2026 07:57:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:25 +0100
Subject: [PATCH RFC v11 12/12] dmaengine: qcom: bam_dma: add support for
 BAM locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4900;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UUgEXylEiIfyENE0peCNzYmE4sxUi2nWK9Ajpi5BrrE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNuYzNnk2eJGRt4JyOLFUae7n6EGdPMeWxfu
 miC6fIYmfiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzbgAKCRAFnS7L/zaE
 w7F6D/0ah6PwxRWwRZZZ5QK1V24RCKtmj7bJS9c2b+P7QDdfyd9Axw1tX6IBQOeiU/H6d76yCCc
 FKwRTrSdvxnIMCjgyz+F9zyo98CqyeY729UpSZso4Aix+B3ur0stcv4j3I/Sjw5S2L7jXkUfFXd
 dDwOq52o2hvUnwp/Rs1xWulqb6yKgesa46m0fCw2PCA8PcKYckNMUiITaITT2Rz9Hvtr9PqAbf7
 oU1lOAi3+mCzJBcVQ/GJSyl3lSAmTeYeRv7JdoEJEnVedQ9LXTGJwmVvjBNt5QGOWov0YJT4mxI
 qWAXfRZ6/qbB7taKE0xR/pujgrZlThSqp2kiIIn58N8VdUFbPHVwU68FRP7gScBFenmwgmev7t3
 0YwNvoniDq3zLervKJu1fxgZcUkjN5RHdNhldom0bhU/KF+/OH1ubzRLLppW0Dx6djvopjCWSy7
 WxJZL9fkwwucP7wBiJfZju3J3UvkjLVe2K8ebI1w0PVGGo0cnYq+vQkd/x+bR6LPkq9gwPKv0J+
 +qwk8haYIqtaArSVdx0Cj+j+t+qMwcb9yWvcxzD2DoVlgA7G6LaSBJF3fWpHh2ZPETwmPW+udNF
 MfvjZ4/g57Z3zSwVWsn9D0xGM8YHTmTSP4nZQlfFdXF0qGcET+J+dzK/onXhMMod+UneCCi3R6y
 E+lmkkjCDmtGdcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a5b389 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KZCnMsYHACgmd2lUPBsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: XJFpLO6vuhhMBsTc8onzJdBizaZft8qD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXwu3+AH/J7YJg
 r32ymY9gzBjGCMlwxPc0Yz63FwV9bk3fUYko2eju54BKffVjrOLsWpV/yZISjfdCmb4Rj04YNym
 b2das1KJWdvi15uuiPNBCDckIfYbfA+eNhKogctLdBbLw/qFiZCPpWnxMbnmXa9jZxuDRlqyAdg
 WqO01pQrz4jmNAlPrdaD/iKw/bzyMPe2MfuZQZ507g7neYOUB04P581mwckwAvXxZ5refQowwyF
 4snahoE5fkJLEQUfwCE8Q17wUS2Q03qLr9zFaLjcGzSvcuagTLv6BgXq7rV0P4CC/azazUMGoFw
 OHiKVCYgIxxKggca8ckFHlyz8bUaeVkSLpc8VsDc2JIhKkvlE+gWcQApPNoJBkkuvmbp5Q8ZQhe
 phYdgH8H6hmM/+0phH6XHjnGZaGZuu4OmS7mwsIl/w7cJN41MlDQQ0s11JH1/V5Qb4nmra+Hu9G
 Y1o0zX+MFbD1doo+wUg==
X-Proofpoint-GUID: XJFpLO6vuhhMBsTc8onzJdBizaZft8qD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155803_132056_C39962C4 
X-CRM114-Status: GOOD (  23.34  )
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

Add support for BAM pipe locking. To that end: when starting the DMA on
an RX channel - wrap the already issued descriptors with additional
command descriptors performing dummy writes to the base register
supplied by the client via dmaengine_slave_config() (if any) alongside
the lock/unlock HW flags.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 100 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..b149cbe9613f0bdc8e26cae4f0cc6922997480d5 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -391,6 +395,12 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	struct scatterlist lock_sg;
+	struct scatterlist unlock_sg;
+	struct bam_cmd_element lock_ce;
+	struct bam_cmd_element unlock_ce;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -1012,14 +1022,92 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
+		   struct bam_cmd_element *ce, unsigned int flag)
+{
+	struct dma_chan *chan = &bchan->vc.chan;
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+	dma_cookie_t cookie;
+	int ret;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return NULL;
+	}
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(ce, bchan->slave.dst_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(sg, ce, sizeof(*ce));
+
+	mapped = dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DMA_PREP_CMD);
+	if (!mapped) {
+		kfree(async_desc);
+		return NULL;
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(sg);
+	desc->size = sizeof(struct bam_cmd_element);
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx.desc_free = vchan_tx_desc_free;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	cookie = dma_cookie_assign(&vd->tx);
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return NULL;
+
+	return async_desc;
+}
+
+static int bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	struct bam_async_desc *lock_desc, *unlock_desc;
+
+	lock_desc = bam_make_lock_desc(bchan, &bchan->lock_sg,
+				       &bchan->lock_ce, DESC_FLAG_LOCK);
+	if (!lock_desc)
+		return -ENOMEM;
+
+	unlock_desc = bam_make_lock_desc(bchan, &bchan->unlock_sg,
+					 &bchan->unlock_ce, DESC_FLAG_UNLOCK);
+	if (!unlock_desc) {
+		kfree(lock_desc);
+		return -ENOMEM;
+	}
+
+	list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	list_add_tail(&unlock_desc->vd.node, &bchan->vc.desc_issued);
+
+	return 0;
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
 	struct bam_desc_hw *fifo = PTR_ALIGN(bchan->fifo_virt,
@@ -1030,6 +1118,16 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	if (bdata->pipe_lock_supported && bchan->slave.dst_addr &&
+	    bchan->slave.direction == DMA_MEM_TO_DEV) {
+		ret = bam_setup_pipe_lock(bchan);
+		if (ret) {
+			dev_err(bdev->dev, "Failed to set up the BAM lock\n");
+			return;
+		}
+	}
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 

-- 
2.47.3


