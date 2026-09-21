Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0016C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2BtxAAtC7hzWMVnPPwzGW2ohbZJK+yghma5dKi8d/Fo=; b=yM+1MDfsv80rl/
	qsl0G2tm/8rkSF6RGjmdGyPsDi5GrUBCt0W8BsQ2fpAfDjjrP5qN1LGFd2KNi3xNmi4xygmM2HQ+Y
	OsQ2atU1EhNdX8UhA0PL8CrS316p2UUq6Av4fBjShkX4ykPYrhPYOG8nNOGBoEQoLpMCMdfuUs9YT
	RDAxAMRJl/22vm1h1yP1Eggb7bP6Qk5Di6LoJ5bx/Ty1agxHqFdI1sgG2lTbEafmIML3d4Kv7O4Gv
	AEflrp6od9A5n+EwvYZNRsnuEW3xF1OW/tT+/JbXtK47rekuSD2LFJSRy61S6rREMk/VWDcKv3jyr
	kEB+UvvxzbXMWXA4AD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbW-00000002A8B-2AdA;
	Mon, 21 Sep 2026 12:58:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbU-00000002A7W-2wCm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2BtxAAtC7hzWMVnPPwzGW2ohbZJK+yghma5dKi8d/Fo=; b=cHRaUuGX/AYENBKG2xjcaTX7ww
	88TeN4DSs6zfekpvYHCsR/tVyPnhcISq/U5zFmnjiVcABZP+A8RPFghPy9AIS0OjU7+dbFJJJmowg
	NWfqkDNBXW9XecZQcL7MR8TsX4HIIXPbSzNTI7X1WSJsZmw9X9xj/AyKZm58ABIMpMejEM+fZ+Um5
	fkqK2vnA0s2SHC4o6Szwop8nkBtsbFGSDzQi/GJoa5a3B3N2LyytKOdErvQzktFqh3oC6QQsXr7BP
	oDgMYt40sUSvLwG79kBFXxn+xIcOc3+Umloj5M/xbFtjFC5yIBpX/F9AcFDDurO/YOWecHbFuwNmL
	gjNIA1Qw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dbQ-0000000CJ9m-25vV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:58:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdueP2091278
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2BtxAAtC7hzWMVnPPwzGW2
	ohbZJK+yghma5dKi8d/Fo=; b=o4dQJyGcUcU9icAH7gsWV5lBnXXiKNpGTg6Xdl
	2jnpW8h+qGUrO+MRuS7y6awgGpN6xeCTLDXZf3Gok1kWRLKPAKy3Q+uBn6MdAeYT
	vmhzd6trf0t2QuLVwsqouxR6Sp2slZq4OavFQnvTVQV29RMznPOcjKuPvldT2cdR
	QhkXgrWRb3PIZIRyC+uoUBstTtsw1aCddZU1Lcc6zZ62mLNtDKnxH21xVgA1YvDR
	Dyhxb5n61jL2zQ50RVVKiJZJiRpb1VSht5/wentyKx0Hlwu4Ih31ySrCfyDx0dem
	ZhxyxPOxCPmsnPc7r7Z8YIPKVNFmlhKycBEl/SL3IpI7FQlg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtefr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a9378b844dso86809137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995513; x=1790600313; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2BtxAAtC7hzWMVnPPwzGW2ohbZJK+yghma5dKi8d/Fo=;
        b=Dy9hoDxazY1KRj43VFyAd251wg9xpUhBQYwjSj8QBxNhiVMw6uyLmAJW/0wn46VoLc
         5Gns1iRvyenwt5LJzmbzp//IJLj1mdzHAQIp1aVNQWGvfBRJ+nAAF2F261WKavLVzzSI
         ecG4v8qEABQ2G1aOG5FKFoRuppXYTwVTt7/ypbHqq0Gg6e/8CqbbB437VXTB7PYFH92/
         A+pHPKD2G72KPhRiCFIRl/kdjPxk15Glan1j3wlEdQufntaUisgTcY6cjjxSCFvMob43
         KrbTKJKNeCKMBjXEzxGiOAtshK/ECRF8U/dTjArN7iwBZh3XeG0d3UXyFbuPaujwybpZ
         xTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995513; x=1790600313;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2BtxAAtC7hzWMVnPPwzGW2ohbZJK+yghma5dKi8d/Fo=;
        b=A9DgVS7WVy0PcaH+MjO6GefU3emKHxbWARA+wty3yH2tOJkBFHNSsFIkkROjIXr9HF
         tsHrQUNPorNZoLzbtqrLVphqt+dLTJLHZsyNl0nvLlLD9jH+gfRZ0Vu8Zr8fGDhqAELP
         a1RdHzYUaVs586AY4Iw1VAf2d28kxHlabavOgfCNEtOpwIlfLJEfdfGxs+MCaCBfppAo
         gkA2DLyNud7ENq5py1HqgaPUbBl4WInHVcE8Az97IQfmEjBztSla4AB04Otceggp8wxE
         OVUCRrqtL3zBk+Ka8L4LCHPPVyaznWrjlQP8v0y5kEfTzstqLnE2Gywj0vN0X8LS/OH5
         7Jpg==
X-Forwarded-Encrypted: i=1; AKwUvBxPIHAVRGhjdusPsQK9Kk39uBpuji/JXOIQkoYjMWavjnM7A5qngK+UDSIQqjk2+vy5zwCgLgn7+SC1D3LQYhLV@lists.infradead.org
X-Gm-Message-State: AFuF++mOzzuoYgQF29PagX7h8kHg8Bq3uDTUDI+x58aZYkTsFa/J79Zr
	yCXiDqfjMmGpZ5wmlCW00ocrrCZo6LEkjL0Ia/DhGJinIU/7+R8P9sYpg2i2BQnB9BamaShX9ww
	YitG0+i0UJDqStR70R018uIsTFtaejmLfJt8h+l1uS8MQMF83pmanm4Nu0SsF5N/CHDxmU+atM+
	bwgg==
X-Gm-Gg: AYBFou0lA+Bofaes043x8Gs8Dwfa7Pgc4Keai90JOUd4XUOXgSeT3CFCdhWAe6QXQhX
	uiGhOAhBSv/c1XKii0avFSltlaYYDGlrwhMgazBnOXCfbj8D1SnN6yIwyKyUily+EGbkp9l3RBt
	R0NJsluPI+8NaFDZbCEzWDKky1np8NEHwn75MW4suKOlm0uKf0zK16NrpeVctl7PJxzDewsu25L
	2Zy9YcBbx2Aq2HDhh5Fi/2OgTLkrMv6wMQ/CKSDh28OFuJGexOlhhKmwg8UwaGd8hNFcVwbfOw6
	EalFRvxurm9HO4NVziRWyM9nn4MHc6WfMKIkGTuS3YV+3I3Z6VXutpz1GaQt/tiqXroQvZd/gAm
	h444RkpJKM6ZDz8kX+HGpcMNfykU=
X-Received: by 2002:a05:6102:370d:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7a55b940987mr4241079137.11.1789995512959;
        Mon, 21 Sep 2026 05:58:32 -0700 (PDT)
X-Received: by 2002:a05:6102:370d:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7a55b940987mr4241069137.11.1789995512495;
        Mon, 21 Sep 2026 05:58:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 00/14] crypto: qce - Fix crypto self-test failures
Date: Mon, 21 Sep 2026 14:58:09 +0200
Message-Id: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEpsWoC/3XRzW7DIAwH8FepOI8quHwkO+09ph0o2CtS26whQ
 5uqvPucSlNzgAvSH+GfbXEXGaeEWbzu7mLCknIarxz6l50IJ3/9RJkiZwEd2M6qTt4CSko/MuO
 Z5Ix5zlIPQBQBaTBGcOHXhPzigb5/cD6lPI/T76NHgfX2nzM1roDsZAyDUqS8jxrexpz3t29/D
 uPlsudDrGo5bCVXlQ4sYQhw1BFjoNiQ9EYCqEqaJU09L+qdssE2JPOUXGerkmGpt6StIlI9DA3
 JbqTGdnadyRjnDKEhGxqSe0pD/QOLYynEYwSnek9KV6RlWf4A8dBPpy0CAAA=
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5447;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4ckCKtue7afXVQydUT++m+321ajwNqqOnFRqUpdzDtg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnnUXMt/LWS8nXrb3hV45sSyKphl1RVONZCc
 psdVWhx3MSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp5wAKCRAFnS7L/zaE
 w9ebEAC1wkocPN+TnPJ03l+G/80kDpN4jMjUD04CWDsVPgSc0RJwdQ+UD1BAk0W/MFfNP/+R4w1
 flhnwfAM8Tn7ft9Z5lkpmiebV8YPmETsTICiTuMvA0uWpEKOa0SVk7HJDrfP85PqCbRdPqe9e1r
 IO2fV09igeIQ5pvTf8R9Jxq6mYNrdb0B3FWRU3UsCOvStS2vuHFMk7YVO+8orpY3NYJLFxU/pLH
 s0Ghe7JF92ZdhC1jvU5gLKIA20w9yFnxbKoMza3go0FZ3qH9EQqRD/F+HEaos8IMvHJSVcgpOrU
 vocdnCqIB9jYR8Q076VcW3feqoNZNKrY+OG2mNaPSOV3wFcyUQOgvbNm0OAJqkE1qMLZgeLtDDk
 HRZCxz2e7epzr8SIj0Kzhb9trYNyzMmp68nkzsyla+tGn+xJU4+z55usBy7Zjps02oqVAIQSxDH
 O0nPNJUECT4sHnXWQlQQmuMMDZgISDu7yjWz1VVzPyZu65uoBVqw8M3Ny/KwrwgeyDPAGUbEKGi
 fxnycoO/SGAvZoIWOmu46erXm2DnWb4ptxI3ZU3aqJx7Xj2l2SUgYdPQytAX8evn9vKCSYPvz9z
 CbLp37FM+m5CNEsFYj/KcAVdVLhOO5RcVzInrmfq6kdMxdbrGvChxldNdn89TN/UtIbbuWTXHZ2
 SdmRZkUgvFY0RkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXyQev+AyOkxd4
 DO3i4CkWTVk+A28Tdbib8qS9+ofIwGUpHN6KXmkzuvKz4v4NunBuw7c05OIIFQDhx5zbVfXroIT
 6IrfGRQxwrM2IX3LOEVoarprCLENMVJTUL8GuwOnDjEPjlIcL/MgNiM7Gv86qbCd2aaBviEnCI0
 AQoJuPxIyC6CvSvgd13qLAiNmrf8R2GzTCF4f334sqFd9eCWVcL5h7r13mFPkRoQzB78e77zwJp
 WWLMDeERIXuFxsmS6BgO+0S4SgJAxA1674q0AwMRtVMqr9sb4mFjL1q8xqfVjffOMwiaQ964g6l
 iwYJN86byzucqUxIDuDFPRPpueRhZBRTR3FKwEDGfxkCLalzkLl4W2/mb1GbPqCC+hIFx4YV4RC
 LXkoxLVOHNuKef/fqR6tyP/PevgdSzzTLg+HmQruN5ZO8vFWxj1g5PL+/aFS1TPFIoZ8zI7PNos
 q050P5XRZwI0zgqXB3g==
X-Proofpoint-ORIG-GUID: HWn079RupTwuXH7rIN9lEnUvFblZq9vT
X-Proofpoint-GUID: HWn079RupTwuXH7rIN9lEnUvFblZq9vT
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab129f9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=9xMiekJfADYskRgvD40A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX3l1LWtDXyCR4
 1hezwdo2kvFDU7eMnsG8wFKba56NysvkTLEhvUdtlNb7ctUkoTG+/zgi/+f20uH7ZXmnk3UGFai
 0K5eN/vIo6YKAIakozZLh0Ka2BdperY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_135837_733821_5832689B 
X-CRM114-Status: GOOD (  24.82  )
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

This iteration - in addition to the previous fixes - proposes to split
the QCE driver into a core part necessary to bind to the QCE DT node and
enable runtime power management in order to allow to drop the
interconnect votes, and the crypto part registering the crypto
algorithms. The core module is then enabled in arm64 defconfig while the
crypto part stays disabled by default. In addition: the actual
registration of crypto algos is gated with a module parameter that
default to false.

Note that remaining reported bugs will still be fixed in follow-up
series. This series addresses self-tests and disables the algos by
default.

The QCE hardware crypto engine has several limitations that cause it to
produce incorrect results or stall on certain inputs. This series fixes
several bugs and adds workaround allowing the deiver to pass crypto
self-tests.

The failures addressed are:

- HMAC self-test failures for empty messages
- AES-XTS returning success on zero-length input (should be -EINVAL)
- AES-CTR: partial final block causes the engine to stall, output IV
  derivation was incorrect
- AES-XTS with key1 == key2 is not supported by the CE
- AES-CCM: partial final block and fragmented payload both stall the
  engine

All fixes were tested on an SM8650 QRD board with
CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v8:
- Add a patch making the crypto driver *not* register algos by default
  but only if the user explicitly requests it with the provided module
  parameter
- Use the "offloader" name for the crypto IP instead of "accelerator"
- Fix device module table issues
- Make the core driver use a list (despite it only having a single
  member now) of child auxiliary devices to register to make it clear we
  have the intention of extending this once we start the work on secure
  media playback
- Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com

Changes in v7:
- Add follow-up changes converting the QCE crypto driver to auxiliary
  bus, adding the core QCE driver under drivers/soc/ registering the
  auxiliary device and removing the BROKEN Kconfig label
- Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com

Changes in v6:
- Handle all zero-length HMAC finalizations (like imported state with
  data already hashed), not only the genuinely empty message case
- Add an additional patch addressing the fragmented skcipher payload
  issue
- Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com

Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (12):
      crypto: qce - Fix HMAC self-test failures for empty messages
      crypto: qce - Reject empty messages for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use fallback for fragmented skcipher payloads
      crypto: qce - Use a fallback for CCM with a partial final block
      crypto: qce - Use fallback for CCM with a fragmented payload
      crypto: qce - Only register algos if the user really wants it
      Revert "crypto: qce - Mark QCE as BROKEN"
      crypto: qce - convert to auxiliary bus
      soc: qcom: add core driver for the Qualcomm Crypto Engine
      arm64: defconfig: enable the Qualcomm Crypto Engine core driver
      arm: multi_v7_defconfig: enable the Qualcomm Crypto Engine core driver

Kuldeep Singh (2):
      crypto: qce - Fix CTR-AES for partial block requests
      crypto: qce - Fix xts-aes-qce for weak keys

 arch/arm/configs/multi_v7_defconfig |   1 +
 arch/arm64/configs/defconfig        |   1 +
 drivers/crypto/Kconfig              |  18 ++++---
 drivers/crypto/qce/aead.c           |  44 ++++++++++++---
 drivers/crypto/qce/cipher.h         |   1 +
 drivers/crypto/qce/common.h         |   1 -
 drivers/crypto/qce/core.c           | 105 ++++++++++++++++++------------------
 drivers/crypto/qce/core.h           |   5 +-
 drivers/crypto/qce/sha.c            |  70 ++++++++++++++++--------
 drivers/crypto/qce/skcipher.c       |  62 +++++++++++++++------
 drivers/soc/qcom/Kconfig            |  11 ++++
 drivers/soc/qcom/Makefile           |   1 +
 drivers/soc/qcom/qce-core.c         |  92 +++++++++++++++++++++++++++++++
 13 files changed, 305 insertions(+), 107 deletions(-)
---
base-commit: 3fe766c979aa6145d9a72533ab32b9da30070767
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


