Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20495CC6B13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=; b=cM2f3CChrSLNWUEw+NqxlBxlBN
	3JzwaPe0CXGMfLKTqs6Ung7u7LsB9tU/qEdmuIJEXErI9dXRDiwhtNiEGweqJGUg08dg52dOHszCf
	fO+r6y3jxqr4Zfm1CQy1IGrFd4KH0ujr8CUv55rqOmPfUGf6U3TJPxY8FkIlavU/2utSJbqxagy04
	TUoVx3uxImqA8bKhqbqnAAxD0zFLxGH9oRMRBiwVW+co2QfYQ+9RC8CuB9G9SqgGxdyUBHgD8LsuK
	F6PJF/XLD06XtnxfbRsXo3omMoNpNqHOakwqQeWHDr2Rf3ThNnXmRR9X+HBhQRszP9UxA8pIdIwBQ
	+RYQPXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHN-0000000CUrV-1j55;
	Tue, 13 Oct 2026 09:58:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHF-0000000CUiU-0Z2f
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=; b=Wb7U5OBWXml+AHVef7fACpD3dV
	LjkB6rs012lATF8CoBNLizdcTnCtvWsl8NFxB5+BkcFT0MhefabtLEyWPU0IrAiexU/+RdWFZQKsD
	hdyeSrqb1Zl7xsDdv1h1gRYjGxiYVYDsZpKc9+eUiA/G4BqmUle3RRTtlCMdmlMeKiFzssQL2qJGX
	C0sQFdr9SPnWeRvdLSlyYPu5wWtXe828PPFIzBsaO2m7jPNFGINCR1KkQgSD+FAXh6PlYRY2Pfbn7
	EmR2I2MthJKVlmmZ/xqWi2x/YVF1LBE/CMeQaV8rRhoXmS82iaZyVw9h2TDHi/u7suqlqlMMBmEao
	DLjo5UZA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZHB-0000000FNbo-43xM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8GQe33054805
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=; b=BYMsEAHCcWicA2IB
	hxBdA7dJpEQNC0n7xDLLbl7NE2S280nt1WJsVdjbjiBMwVcm7N7qSowOHArvHRNu
	0OCqHvZEoDnSz77pTtTqfNqiizOaPNLkYGlDBr37aZNCVj26mA/Eh3xIg0ouabPJ
	YQuAhFXk0mwvqD8Dc/q1kxtM2Zgjk5fllXr2cAqKCMSHhuGnZLLq+e9djw+1wKaE
	U5ekKzoSq/ccaYzTcs6t1u3s7GdPepkzrzDVty/1sbpXM0CKKWLMawO9ngcMRi/J
	1Fda+JH/qjVXg2k7I2K/LjYtZTxQD3pLDVhGOMiIfcCD7xwmC5KKsf8gWSDlkBMZ
	k0lQKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeunpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso487356585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885507; x=1792490307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=;
        b=V5HZcLjKmO8zTzNvYSRQgDPMqVJF4YS3yG6Rkzc+uq8ppcxO2vlteWFEc8LgYnxLe4
         ffDHbZRFlRfzDKZl9PFgHwF32SZwtqR1agt4MjLZe2ZEQDKEkMj5jykxqq+cOBl3n7Me
         u6AtWLqMInnfVALc9Jn2lvpYgUoLHACKaktRWPQNzLu//Q4w7WxDPM1ys8cGnXi26FLV
         ApCJ3wCDyOrRNzqG280JP9CLkVGUsWowFEuw4NZdJrV2zBwsef5Jzht+iqc/Y8xlJkP+
         3t7X6FmDut9S+DJR20A0RGiOPlZefOsQDeKdavcrUYach1ZcxrNOIwfQ9ccwn7/nlZnH
         Um2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885507; x=1792490307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=;
        b=rJC5I/hmo9jo/Pjv9D0og8feuK6wyTz9z/2prvMr+R8l4/dcur1rGm1yg9LUuwfsUl
         ccDJVIs4lz+cgOWISG1agvUXTqMCcr3PSjJ02X1VsWHfsYoS74D44deHYgoOlVfDU47V
         2rvSQIWppPnoJG9XmOB3f57kWB4AMC7iQrkcMdfmpexx9Q8/zixdo4/Qwuy+b11821oR
         lELGlf7irRo0wpGVpHGDRDjTWSx28DiaMWgeUAoeS6SYBB8LOWLyfPiXCOMnTKWy7jMh
         3crLbdCW5X/EIP9A+KCs9qWkZ1osiqavY8JFJ5zVLxzGyfW8IImUUpmn8F0uqTRdwvw1
         k0kw==
X-Forwarded-Encrypted: i=1; AKwUvBzjZs1YU03dVjtLFsbJVtfd5fO/+5R3DTlo9Bg0VWNC422cMtgB8D+9lW58e8zelscbggM9dqu6XMZrayYEUnZi@lists.infradead.org
X-Gm-Message-State: AFq9FYLlMYF2j3dqVl8bg6EYbVuQvR0O3GPFTD0dbelOd78O/vDSwbsB
	SNJV/QvS2CWCsdB2LQR5lvdN0qjDZu6HmP7w5hKJHLFjNfeD9+EIjI4lzmCLbC5qvyPXdvrsWBm
	tHCqbmWQOunPJhw2UrWNQOfM/uhYpLLej1cdYMXA3fuoWWylgiH9baJWQf4bBxTShvYJPYAUHs8
	gf5Q==
X-Gm-Gg: AYBFou35zvLwHQaKCWsIkBAZGqZiEdyaAu3Skp1K76/DySgzgqomG4U8uL7gy6mJuPB
	34QtKvreU4FODmlRkP799xrfHGzgj9n7ds6DDaa6NPBgHbSC4KrUKBd3M558jpUnSJoXQReCECC
	jPjUrvpAQLFStgW4aPqyA5JRhahAew3bNBJk4jOIfhXyqKbVnwFd5wJZUgl6y/Ktfkdwyr2RO+k
	fccfaZwpQxerF9ToXlHDPuY71NYLeIfIwjoJYXGqnhhmiraiEq6fnogf+VUym65BI0pFa4QnNTK
	ygh0tPii90yfAY3+s/LwWkiq38sEnvdZZSxcnpam6Q9zbOQJkHT+86sa3SA+7p+JDpFLMB8s7Yp
	hJ57bZor5cmNrjUPdi5cMe5Gn5P28
X-Received: by 2002:a05:620a:44cb:b0:93e:e5f3:7b6e with SMTP id af79cd13be357-93ee5f38b69mr855790985a.79.1791885507512;
        Tue, 13 Oct 2026 02:58:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:93e:e5f3:7b6e with SMTP id af79cd13be357-93ee5f38b69mr855786685a.79.1791885506845;
        Tue, 13 Oct 2026 02:58:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:39 +0200
Subject: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3392;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2nd4EPjmP5Thck4Qs6pRTamguHQZC9cCn0nzKiIG47M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCjsgSGKAcbR2tqeAj2xTZFeJ9Fi13XldMI6
 dDL/XwiM2+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AowAKCRAFnS7L/zaE
 w8zND/0ayJnr63lmfmN8N4rxT3vmnYWCFPxjF78PqCiLvTCv9aOhtNqf5fvlibCZamfgGl2Wh2g
 TIpKMrt/OdA8QJUOTCZwbvNuz2ECEuGvfD1gtZ7F2hrXNDtf/Hqdd0tpziq+zCUfjQI9CChJcNe
 JcOUhnRLT+O0ugnuLmWeS7oH5xhFN8G8pKXBQx8oAKp/kmc8qPkj6VWFM/ehGOnIl+Vp2I6U3kj
 t9MN0TZiVRcy3qQB+CDhNXKrFvX7t6PHLrRRBq2qX0+x5cMvnwNEbvRQFY49+BicPh3BlvPRne1
 1Pl7ULDtSdmHkfckkXfz6wvEPM+OJ/Ku8RiPlnfBsgYK/wIlVtpUH+Lyi9gnJMYlIVN4jIw84tJ
 CTg8Tfuv5BRwfI1yGtttnIKj4F9WQVNQa7f2alvmhN+8cL5/Sl8TlID/lOfYcjeT4aYicE+QPZ+
 Hzch9+IxHSNM7bAH7Nw0HJe2JOdRsVaExgnJnQBjDlJqqtuPKZb5pJcw97rnUJ6US2rTsXK3lEB
 wf/2Mt2xb20pIoPHedW/K5bWW+l2TIRyJEHhqgUHw4EI1zhy/0+0wHbaimzuyaiWB3/1Z2QDwAc
 CoVI5t8mwhISEHfcl7j/JVygbCs+5B3R+p60Dogmrz65ItId18SC/skioXrwyG5+8n4A5wn46Du
 WSsOrK6TPEiSchg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Dius3biiC4Yic4wrMStohz7XBSUOpzAA
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace00c4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX1GOUDDEL9GJL
 xAKu6gifZoeSMXxfFs8BKp9g9w38h4TBselfXuQuZwCwGEVmYQ7THGjiK4gGM1g2f1OQ0gRuYAe
 TNie3LSPrwGkRaWU1SzLRWoShvScLD8=
X-Proofpoint-ORIG-GUID: Dius3biiC4Yic4wrMStohz7XBSUOpzAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX2/ml7EMbExmg
 lJ6Q1VqyhM4aQo0luJH3PWshD+zYfR6lvu2ZyH+1BTkFZFB+iKs2nr7zlhJ1t6YPHqvoJ0fR8Vc
 NJN1wr4FKQSfPZxClCwbxR/028AcERN583ZBnqGg9LDcXBin9joWG8Mkg4ra/cFpYRHh1AkzXnT
 v+qP0Aybf8pMqqUQFzzZb9wAQqwHH37kY9Y1MaoA6zqNrC0JyMxoTfdKwEVbiszcszm1rObT280
 sIN3Z8nGXf0FzjdIoB49YVmUP6SyrmMqfuFH/b6zkXaZSK0KJNcg7n5BgoOOBhXwanfE2cogeIC
 0GGHUTIpD7loBnU+eLBRwyQpPBRgFITYXElTP+7eajDz8sAnU0MR9Vn3XzAMxs6Y6oftShs6+N7
 7oAVb12BO/63zOG48AzYYbBoepdAmc61UpXBb5g2FJWwV0tvrU0NmuqLiXtygNa/FZ5i1wEv8E6
 hnJhq8fDmcxi2co6mrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105830_373527_7162C4E7 
X-CRM114-Status: GOOD (  20.18  )
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

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label.

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..e80927f87ff26fe3f51db6409f509fb99ad614a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1949,6 +1949,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3


