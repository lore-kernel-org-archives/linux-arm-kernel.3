Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B7CC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=; b=RVOuLlcIn3rbAs31FdGWQ5mHB5
	ef4y4HWNPvwMcYXpp1Vt4ZfStMcPF0KQTVUIVGruLAnQqKdNdL2TGR1IoGv0d/XtuZdOsvsoR+nVe
	P01Z8ItbtxRRccJPyG2ZIKHYNYFMe6noqyjuBmMn72hubKyFyU/pl+TUQZD/jkYVOZkG1Kycm5Kro
	8i7L2I08eK1JgiqitSGSbExKr8UfLh0tD8qSoHRGrXLD7ozCzlfKlHVE7iahA0kINAEeih8h7F0yU
	zmhMJkCk6SOXTdMDRYg4Eh9X8ZJsNTB/mQhh0Y1JbFPX9HYK7TPaOxqrWDUf1gTCnc3RKROjv/9tQ
	3EBWfKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904s-00000005OFl-0xnz;
	Tue, 22 Sep 2026 12:58:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904l-00000005OAf-0Q48
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPYtQ3671747
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=; b=TYFN3Rj9nbYmcuo+
	CQZO2Gc0LDvB97lIWN2+3qtDKRNGrtPfoDup28dl+2vwoWhijk99Ou+GPl1OZbfF
	ZrYUHeUFuaKIMPbCPDKbSxy7V7pdM7dywlnvftb7mcF5RnJz70QSkURyVdNSGrrK
	4GTCT6psWzp2cQOa3dybij6E5NqQ0gHUarikEwfE01gV3L632efFU/BLG6/dodYE
	xIX1G7Brd83b959qzHs/hWo66EoFIc4rypgorleR8QjqO3DOIph2nHwmPzyewO6Y
	GUfAJj0d3W/B75woNe8MOG82i8PV4TuZRrRqQ+LDpR+UVHtoGwXLiIuKkCHLC1Bv
	bKA4qw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt8dfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83007a11cso1347957e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081902; x=1790686702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=;
        b=MrAF/F8xnGgTDn8QjFRoD9P+JCAWcqXEKJIjUocTSN9ndqOCaSjN1/GiXfwSUwxUwM
         Xt4YhNh7Y82iSlPfk5l4Fx3T/jILOJj1GRniU2xrlv2itjKSlVH02ydPf4KH5hcx+FnO
         aCNK44Y8imx4UF/jZOs2npVLAZNA1GQWtN6MOOspy/J917MZv0+lxLSQL1LN7CkmBVpo
         XfY8a6DeHlL3decUEyUpM2zUmn1KUBtbQ2T1c9eu3FR4/a5mzlJirHqcC+KOduxyvceh
         3VNJcJmQSyMf8bnvXj+sumPMp1f/k8CKzseqk4F6xUNX0AW2dku07TqfBKI7dR6XNIHf
         2AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081902; x=1790686702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=;
        b=Ew7QkEerGxqZ9rTZDL7KBuJu+1PUxnYkVZv6vh1iWpf+mHentnV/vi8ZAWKHmbuZy1
         wUH8RE5e+m4zUXSLcPdJiBycVbTPHa+dGvRInA8LioL9ftPwlAuVajCFhPonG28yrwGA
         VM+YDMmq+s5lHzA3v3aWN6+KHhbzTONHUNY4J1QDFiretLW0RJTf9JHnHSMHNpcpRAJ3
         3qbxw9tFilPPZpP1a+63faOmn9HmN7tloi2XLIr3g3yv5MOkF6oqpUZQvZktmllz2H3T
         /lBHjjatl4lYZwRDruCf1bxBhYHIq0P/VkOugbcbBcpLxvidCH+SRtiWxy442cwPZitL
         PCBA==
X-Forwarded-Encrypted: i=1; AKwUvByrKYDZl1zS/0YsvxrJoUbDOx4u52BXUM+HinYp+nxVW3k/0xH/X5TWvOk3i2bSc9CiSQskmb3/SstJ6k51maV7@lists.infradead.org
X-Gm-Message-State: AFuF++kTU3Jd/1k/gWaLxa5xdzfi7ZZ3RoVneYYbGj8GNpMajQFOMa0w
	TDH3qTNF847C9hmozApOv5qPaQ5h6SdzJh3q7AVqnH29y5i4XSzhT167jUfSGIAGlmsTrom53JK
	zPK2iwJv1xacg93dQjg22f/yV89d1dETug35Iw6L7IgHCuZ49MY9OkeJTnng5pzGJIPbDq1Fc1T
	lRqw==
X-Gm-Gg: AYBFou1fVLqxmi8oUb8NbMVdWnZmUdAMOjo5sN4Ah5zSD8UKwcbsMnUhQw4jhoZAinr
	T+/JIj8zHMhG2+0WviqEpKAC+WoGN1UWErd876NL0zZhC4YQnlaIheGwR8hsotSwvKVSGnUwlMs
	wW2Ai4Oq2SC3MvtSWznHUbUdBz2L+Rk98LgAhyMFpnXhcE+bc4Rog1cHFw3noTbNZuN9EKhK2o4
	5f8nvu2DYFjcG6mb/1EOace2Ig+esaJmhiBsUi6KPr1xShcVHDiNVk1Adl6kIe7Wpuh3xqIEG12
	e2YJQxsKRGzfm5eR7lc73K7CAzUWS+s5xi93g+jlZgXoBMh5/gD5rBKUIRHhguLDSFsWLNroPX3
	0oslpoHpFcMYukBKRyYjU25pHZpY=
X-Received: by 2002:a05:6122:30e7:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c9b5941ac6mr8272823e0c.8.1790081901640;
        Tue, 22 Sep 2026 05:58:21 -0700 (PDT)
X-Received: by 2002:a05:6122:30e7:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c9b5941ac6mr8272781e0c.8.1790081901093;
        Tue, 22 Sep 2026 05:58:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:28 +0200
Subject: [PATCH v9 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-13-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ji7o4kGz34cmVqJOSJOjQ8rHVe1A4JqseoZChXshzjA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsntBZe+g9nIUmEpjkGFYbi2XVnb0JwBoWcN0y
 jLA7FsjUqOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7QQAKCRAFnS7L/zaE
 w1FGD/9zS9mD6MAL7sm4C/rsUcW5SvYKlJbCC0/J2T1qsC0SdU/4+x/En2iirGXcg8nK8eLFDR0
 URYFkpKH7sNHFAaAb/X6Fpnblmsd+qSLlN6UOaARP9SjW5QeVYQgACox15hWvRd1usp9uOXtUUP
 LLvI5fHP62PPWN7YwnYn5QRLhTEMzQeMO/eOeSrdYY1JteT/Jen6O4BY6J0/xvcPfYkbxv7RY+O
 npRSFYCxCk2/Rup6FEqjVN9jOukFkbopqOeU6b/iU62Icv/YJnia8FXsBBXWzUQj0swG8NBBZ1V
 PzaYFhv+0WVM/ASVixkxKCylm53ucCmu1iFcPjaN+36oocp9w1W9svt3d4prcqqnAr/RhcSvKSU
 UEsCMPY1++j0bv6DMfXRhv87czKaIDBr6qhPWMvd40FtxIihkWNwgcS/53gz3oZKKO+M/i3yeR4
 r/obEbKcDaSoWA8olvOProisSg1GaLf7AD7FochOcHD0EPAOk4p4sWhyXns5wic1C7P4EMgkAnZ
 A2Z8hkwBkUxtHvMoX/XLC9VlofEIlFN4Scbn45YB9q4w/pNDRmSO2fTy8/d8MwYtc16pw+4CNQR
 0YhTd73JZ0rCc1c63rNuEquGcfUK9sBMoqYhkVXYr2rgDsLMu6B0YF+vFBm98F/LwCYZFUUduO2
 3HAb86ZY2+UUhlw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: -hnkpz3tM3EE-JFqrJCPYrVB0CFTBG2H
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab27b6e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX6fqpd9TR6DAA
 xxUjNGrMy+UH2NkXjIjN6ZzJJ62g+y96yA8nJmw8NKbbOl7k4FMGCLCyUZfa+JNqlfgI8LtBHNe
 aJiXPKGnbXgSFOlT1ZHR1GxB0J9PA/fvU4YX3lw8Q2wv3V/ep5oBfhVrRlbIP5KHy5MZbc0xa8B
 sydR7gwPGpqhFJwmm2PzCciNXytvXXfzBEib5EtAdXcsHFFaLO2T14jabEgg51L4vZcN2sT3Qjl
 2AgTpskN/s+ELOgbkJgkEfb5XwWaezhrKXeNbsL2OVaXmgQ7OFUPt9MRR0ogrOpWhzP00R9JSt0
 ttgK73RiQwZmqp28oaJqKqyRjIcuywtukwYutO8fazEsOarkba26VJsAlxtKavy+1AGDBqsdg8R
 kS0SPiFTXn/N6wOxC50DA+J3tnQc9VUQvytlITkBoV6YdmWrIpEnriTWCRBiCacjt9nk1Z1xukx
 KFGX/JlW+l4jHL43ZWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX9HFHGWshX9dk
 Ulvnl0XyoVBKuJDEUKSl2GlqgHiPGae/D+hYvVAmHim45CrduSdYGUcNIR+cskAVENXUjsVblui
 9xEHBQ6MGRjNMtSVZ3kDVt1rQn508ZY=
X-Proofpoint-GUID: -hnkpz3tM3EE-JFqrJCPYrVB0CFTBG2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055823_151912_CC2024C7 
X-CRM114-Status: GOOD (  16.52  )
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

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e80927f87ff26fe3f51db6409f509fb99ad614a0..760f9e9fb2ae13392563ade5de871a5e882d195d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1663,6 +1663,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1949,7 +1950,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3


