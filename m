Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92FCC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36lsZqMkhxe1tyxw0WZEHYVaTrXfgR4FpvvmH2w2AqY=; b=PYhmCHhE4LNsxH
	qofsxDrn85Ypn11hw0EwTVFcM5XkHn8alDSoU7QyNfBrPXWsei49o+DYth47Im0jYx1Qzq7m9onC4
	eHAWFUWFi2BrGMlm8HG+vU3NI6COvwyeFudQVoQDKBghBbgQ2a32sjlGCxUxWVw730GbkyTz5igY4
	aI6Ws3SZBjWjOoVrPQ1rGVhJLq8zhUCtF6WoZV6Dhyzd4PLWsaLglMzuns8RyWjhKvkOH6sB8NrOp
	0K9k9FLWIzLcSejcf3WvoF52z51QfXBLnH8Dr/epH68BVGWqt/K9GInhRxfAhGiNBABLwSa4WDB0s
	B6l7LYz1eY2LkBhjvS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbM-00000009Wxr-2dl0;
	Tue, 21 Jul 2026 13:33:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbK-00000009WxB-29Dy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:33:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMBo81922884
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=36lsZqMkhxe1tyxw0WZEHY
	VaTrXfgR4FpvvmH2w2AqY=; b=KImvba/yufTjrCSlNDsocBny62gEs0b4XJRdJe
	Yxq4eUIo3hcmwv+igwpA0QxBVUBIv82uRPF5P9d6nbzlfZZvEW2ZPImGwFGL9032
	SHcaycHiOSRrAmlNJl6uqYoLocXJmnlUS/YIyvB7WKZywKW2k855aG/Rn3trtSEk
	VGS/FNF/EE8Ll+HKdpYrdqwWmZuKrQ+tEJJf5H3Ag4f8o3tqdzykE3r2XlF8Ch6V
	rsWdZ+JvN6mtN92/AgAT7D/7rngMwsl4+Z1bUSaOOhEsckga1E5/tVc/n+Ky0esq
	dgvaZcDd3xkIGkJsz0ppVb6y6xen/oSGqhaRq/MjLkPHf+7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68611kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso3586011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640815; x=1785245615; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=36lsZqMkhxe1tyxw0WZEHYVaTrXfgR4FpvvmH2w2AqY=;
        b=c40ssxEwMdbG9toj7bNzwGr7E/lWOJbUZR7qGMYx07zvG+rs4RreN71MMPPkqJqPxl
         tRGWz0EJpL9U/uq8F7Vf/2zpHIJBtyAF8HyKF46mrjFnDEBOk/qLwHfpdxZJAFAGnu9I
         oIxvtJ2rRYQJGT5dz2eUAwzQhUaWwzcBh79Q97f23TY0kxi8K/Qy8Mr+YX8j9RApYXzG
         nomGcEQoDrHM1vX9phsW4mOtQgYyTC4+jDNt9qwZApLWMOkHB1eR2EE8dNpvsg2GMQul
         bhsQDUFFfC+utUeIs1Vmsk822UuLgWESaAfgn4/usne2u3JR0laimGN4woun3IDRy+gx
         J+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640815; x=1785245615;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=36lsZqMkhxe1tyxw0WZEHYVaTrXfgR4FpvvmH2w2AqY=;
        b=cVXw0ZumSIsSJJ8LbkXm63cXJskoiIM5mk9QyYgKAwWUaHuJMIwfwxhSDe5eF983AR
         78RPnCl97YZxnVDnZbJY26CYDHBTI0TvUdvdYuixy3dWPF3ZCFJPDpKgErUVZGyEfrGw
         GF+RUwftYHHAX8wCjmzEytzcnraoG1JbDXjplzMJVX1o/uDtpNh0ftcnUpjj4p0amyoS
         cnsVCDEDjInoZxMll+MsbkNfSsHr6KPFwPm7odoKXtaS/PcN1wVDf6Rm9JncJp+VIOSV
         tDjrhjYydHum5bkkMJK2dqow+wzfHiy/EqUifMRnEKNBwqK2LH5axx3doOUvxb7XDdUR
         KzJA==
X-Forwarded-Encrypted: i=1; AHgh+RqpRb8mlm8xAcL/HZ72nOK/iYDpIdWq0Acttzvt+w7fv3wL0R0zCcU45/oOi82PJBykDOo4PyUpq64gUZCHDbc+@lists.infradead.org
X-Gm-Message-State: AOJu0YzIr6sl1yF58Suh4Fk5mpw1S5Jd2feh+ijeqfgdNsexTlmc/kvU
	vQur9jBz/Dm9smKRU5RxgedHU03kiaKV9CA71Y56mWUOjzAUfDUDmCdSNU2eaHOli589j1oBwzb
	oetBxLzELJZofEt2VDlepZ219gpXmHWhbSNCzEBs/3GyD5rjc9BIrKGp5ZOVojf1JILgAg2LxsK
	GRrw==
X-Gm-Gg: AfdE7cmPVm/HqPthEzUDdyJxqzMXWrpuc/rbwnGkyr3PCvU28c1JmYoyrLEhoUokR7Y
	s3bPLo59JbDP541ZE/1rzbh452uG+LfLpX+XuglL9pvRmG+8Si7wcDV/cU9sU8B5XPuwuvlr/Af
	7EffKt/grJA/myWQs25/89cuqFT1nzjhmg211O5GB89SLE0EyaxuYVAXDuGURZ7XJSh4b36gXIs
	X0q2BMD/E3IVLpmPY74TK1SFYS2DiWi4L5gYWW7R4nAYwhT9nefgfvC+B9D8XdtYF4OeL4o7Ycb
	e6Gla3/ZqI89+GUZJ5PIqH8VjvCXv6ycIaGA/A8QGtxILIaW2mSFWlPbA4x8E4UTPjZHgTnjtUr
	3QSHzq3fXssKAIWWOz2cF/uYaZwWiig==
X-Received: by 2002:a05:622a:1f17:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-5213c9dd981mr176841881cf.30.1784640814879;
        Tue, 21 Jul 2026 06:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1f17:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-5213c9dd981mr176840741cf.30.1784640813986;
        Tue, 21 Jul 2026 06:33:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v23 00/14] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Tue, 21 Jul 2026 15:33:05 +0200
Message-Id: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJ1X2oC/3XTyW7bMBAG4FcJdK4MznDvKe8R5MBtEgGx1UiJ0
 cLwu3do1DCBkgcRICV9XObnZdrLtpR9+vl0mbZyXvZlPXEH5Y+nKb2H01uZl8wDEwrUAELOn2k
 9clPmdMxzLnva5qSLjwBUjPAT//hrK7T8vqkvr9x/X/avdftzm+Ts6uidMz3u7GYxl5RzCij5M
 c8fyyls62Hd3qbqnX1joOsang0fNFmMzlvE/wwQDwTBdxEQrBDZoiLZHLJ6Xvf98PkdPvjj44G
 bfxbcLSOkwL4FbLEDpHNUTuDIwsbiBXQtZEt6R9ISmkJiZMnWsn1LsiW8cSUqckkNLdVYKPuWq
 ufFbwMprowdnpd+WGp0XrpW0EUtDXAFsh1ZprFwsEdTLaUpQwoUYxpZ9mHpUSYsW1oG7bUCFa0
 fWa6xcLDHmnTv+Vp5NDHQcF2+tfqXBmrihVMWKadIKgwsFA/LYH+PWHOvDRkOvVNJ6JHV5N5CP
 xNYcx8TaicL8PKGFrZWv46It/soMriIFpXpWNfr9S8G5T3U1gQAAA==
X-Change-ID: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14344;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qufaRDM3ELUIkQ3GN42VFLouSw8vfXLw8nEQxkCgUeI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UY/v+B08iMI0sFjjOFHZzgy/OUzFwiUx3Qf
 9u5CDDBgKWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91GAAKCRAFnS7L/zaE
 wwWDD/4jTes+5+hFiFcdRQcl/RIl8h7gXbmPIDTYTrZ6FYnK8gePmRUrgF+HyQkoRkfx9fdIwaO
 4ZR1dKYEGQUox1pjPEilCChGM5elewBvzHxJO62VE4hCWY77VtOlbJke8wN3QwMe8zvIlLeUb0G
 WWf50YHV2G0Dmrh8jvQzjS8+4RsJDkXSl4kwOVHnA6d3VGDfzW8odvQXnbjQKZGqDjUvjnZR2A2
 tj2zhYbQDciicLAsSK7nwv0m8OH83vIMYupq8cwOuI4AYpiFdL0QAjsOr/m2QFTVFalVTQ5hiJM
 XhoyHKSZSIaKgQqSMppd60a/ldNXxk1Bafgam+T5aFfDyGbqDmJJEbacSJQAqlaf6/rEyh7gh/z
 5iS5KBBs9jODIfGgS48PTFlcjYN2PMiqiDALPykibTKsf/pBgYrVV3HAGdAU11SMkSS9HfphBQA
 pSyO+0v5JVFt+5diaxBjApm7hLjs4PWmTA7mtEd4V5mD2m5l6dL7xVzwmqP56rBxsaSUZo6nurL
 eW0g3xsF/ErcKo99wT6jDuhFPd5TLofUR88egQcPOvf+Fbqyr6/OIu5XxumLCwAROMdODxiE+Jr
 l2PlTt3PCAT0RcPWjllFNEtzuVzOhaP8s+Hg+5bgk27yjtfCqwlMAcVHmgd3skYj+xFvtZ5e3b+
 P9hXugjyL4JFPqQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX3GDByU59NPfO
 nDSLv8HOXggNcldwWoKgtIPCX7bD4zqqIlUqzskKlsxoZHxsqsq59+3mSNBMg0tm0sOLtgN2BaE
 vt2kv7lJsAEU+3ivAB60SpCZk831Shs=
X-Proofpoint-ORIG-GUID: 0lvkJz7F7S5kuh8Si2FN37Ui97iD8RsU
X-Proofpoint-GUID: 0lvkJz7F7S5kuh8Si2FN37Ui97iD8RsU
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f7530 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=rl9B2ycCaUGxRu6LYUgA:9 a=BPQY48OK92vdoY-E:21 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX9NasrZ5sIeHX
 AOu8S3iCwnGjDXOF48kzOlBoIN81IuY80yk1LfSc+/9lUD/xD+AHOz3crUIU9gla1jDf7HCO9nP
 yxhpjpqPWhcPr2Cfv1xoBl0/15fXceXTubba/NHPyqUbA/RTydgEO7UZ7dcl8zwWMU01ZDnjeXd
 6YPMOnbEr6wEVKEHnLG2QNqsfNAGlOl5bfT2A9A5dYnI/qLwPefvzMgmw2y8FlaVXXDSON6m3lC
 2VpZTMY6jpkQjBfqjqSXD3OQJRJJpR60i0pgctwnt6GHg4Cpg5d0jnK9RWuLhr1ILKBZdjiNhaE
 Pe02M6LjbgCaycicRPeLdRECjjQ9eZHYCy8LUNiTVuUtaJ8p0tve1EWzaqCEBzwdLGSzbGXf95h
 YInB/wgKIKss20lE0zzikqsqzyPPwuvKkNDynEoSgwI/ehpa05rg4yNmr4SsV+u5m19Sy1jCImi
 4yPzE1CCBIy/RN5Xyaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063338_681230_56872E5E 
X-CRM114-Status: GOOD (  28.53  )
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

Another round of issues pointed out by Stephan and Sashiko. Stephan: if
you consider this iteration satisfactory, I would appreciate any
Tested-by and Reviewed/Acked-by you could provide in order to help move
this forward.

Merging strategy: there are build-time dependencies between the crypto
and DMA patches so the best approach is for Vinod to create an immutable
branch with the DMA part pulled in by the crypto tree.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking to the driver. The BAM driver will now wrap
any existing issued descriptor chains with additional descriptors
performing the locking when the client starts the transaction
(dmaengine_issue_pending()). The client wanting to profit from locking
needs to switch to performing register I/O over DMA and communicate the
address to which to perform the dummy writes via a call to
dmaengine_desc_attach_metadata().

In the specific case of the BAM DMA this translates to sending command
descriptors performing dummy writes with the relevant flags set. The BAM
will then lock all other pipes not related to the current pipe group, and
keep handling the current pipe only until it sees the the unlock bit.

In order for the locking to work correctly, we also need to switch to
using DMA for all register I/O.

On top of this, the series contains some additional tweaks and
refactoring.

The goal of this is not to improve the performance but to prepare the
driver for supporting decryption into secure buffers in the future.

Tested with tcrypt.ko, kcapi and cryptsetup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v23:
- Use the same struct device that was used for mapping the scatter list
  to unmap it
- Change the type of lock_scratchpad_addr to u32 as it's a IP-local
  register offset, not a physical address
- Queue the work to retry the transfer if setting up pipe lock fails
- Fix missing argument in dev_err()
- Fix commit message wording for DMA direction
- Validate DMA direction in bam_slave_config() instead of storing it and
  rechecking later
- Link to v22: https://patch.msgid.link/20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com

Changes in v22:
- Switch back to passing the QCE scratchpad register address to the BAM
  DMA driver using the slave config structure but this time provide a
  dedicated peripheral config structure
- Rename the scratchpad_addr field to lock_scratchpad_addr
- Remove leftover local variables
- Use the BAM struct device for DMA mapping instead of the QCE device
- Use cpu_to_le32() where needed
- Don't silently queue data if setting up the locks failed, defer
  transfer and emit an error message
- Remove redundant is_lock_desc check in bam_start_dma()
- Link to v21: https://patch.msgid.link/20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com

Changes in v21:
- Fix a potential race with new descriptors submitted while hardware is
  processing a locked sequence by clearing the bam_locked state right
  after queueing the UNLOCK descriptor
- Link to v20: https://patch.msgid.link/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com

Changes in v20:
- Don't use DMA cookies for LOCK/UNLOCK descriptors as this leads to
  dmaengine state corruption
- Handle re-scheduling of a DMA transaction on full FIFO
- Fix DMA descriptor leak in qce_submit_cmd_desc()
- Link to v19: https://patch.msgid.link/20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com

Changes in v19:
- Fix more potential issues in remove path (sashiko)
- Remove unneeded return value check for vchan_tx_prep() as it can never
  fail
- Link to v18: https://patch.msgid.link/20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com

Changes in v18:
- Free the BAM interrupt before disabling the clock in remove() path too
- convert the size assigned to command descriptors to little endian
- don't pass DMA mapping attributes to dma_map_sg() in bam_dma when
  setting up command descriptors
- Cancel the QCE workqueue *after* any outstanding DMA transfer
  completes
- When mapping the scatterlist for command descriptors: use the actual
  number of mapped segments for dmaengine_prep_slave_sg()
- Drop the leftover read_buf field from struct qce_device
- Unmap command descriptors only after terminating the RX transfer
- Pass the actual size of the metadata struct to
  dmaengine_desc_attach_metadata(), this is not really required for our
  use-case but let's do this for correctness and make sashiko happy
- Drop double assignment of bam_ce_idx in qce_clear_bam_transaction()
- Remove unused QCE_MAX_REG_READ
- Link to v17: https://patch.msgid.link/20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com

Changes in v17:
- New patch: free the interrupt before disabling the clock in error path
  in probe()
- New patch: cancel the QCE work on device detach
- Hold the channel lock when attaching the metadata
- Reorder the operations in devm_qce_dma_request() to avoid freeing
  memory that may still be used by the DMA channel
- Register algorithms as the last step in QCE's probe() to avoid making
  the resources available to the system before the DMA is fully set up
- Fix error paths in algo request handlers
- Don't pass dmaengine attributes to map_sg_attrs() as it expects
  dma-mapping attribute flags
- Fix a dma mapping leak for command descriptors
- Rebase on top of v7.1-rc4
- Link to v16: https://patch.msgid.link/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com

Changes in v16:
- Fix a reported race between dma_map_sg() called with spinlock taken
  and the corresponding dma_unmap_sg() called without it by moving the
  descriptor locking data into the descriptor struct
- Also queue the TX data descriptors before the command descriptors to
  match what downstream is doing
- Tweak commit messages
- Rebase on top of v7.1-rc1
- Link to v15: https://patch.msgid.link/20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com

Changes in v15:
- Extend the descriptor metadata struct to also carry the channel's
  transfer direction and stop using dmaengine_slave_config() for that
- Link to v14: https://patch.msgid.link/20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com

Changes in v14:
- Don't return an error to a client which wants to use locking on BAM
  that doesn't support it
- Add a comment describing the DMA descriptor metadata structure
- Fix memory leaks
- Remove leftovers from previous iterations
- Propagate errors from dma_cookie_assign() when setting up lock
  descriptors
- Link to v13: https://patch.msgid.link/20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com

Changes in v13:
- As part of the DMA changes in the QCE driver: reverse the order of
  queueing the descriptors in the QCE driver: queue command descriptors
  with all the register writes first, followed by all the data descriptors,
  this is in line with the recommandations from the BAM HPG
- Set the NWD (notify-when-done) bit (DMA_PREP_FENCE in dmaengine
  parlance) on the data descriptors to ensure that the UNLOCK descriptor
  will not be processed until after they have been processed by the
  engine. While technically the NWD bit is only needed on the final data
  descriptor, it's hard to tell which one *will* be the last from the
  driver's point-of-view and both the downstream driver as well as
  the Qualcomm TZ against which we want to synchronize sets NWD on every
  data descriptor,
- Revert to creating the LOCK/UNLOCK command descriptor pair in one
  place now that the NWD bit is in place,
- Link to v12: https://patch.msgid.link/20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com

Changes in v12:
- Wait until the transaction is done before queueing the UNLOCK command
  descriptor
- Use descriptor metadata for communicating the scratchpad address to
  the BAM driver
- To that end: reverse the order of the series (first BAM, then QCE) to
  maintain bisectability
- Unmap buffers used for dummy writes after the transaction
- Link to v11: https://patch.msgid.link/20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com

Changes in v11:
- Use new approach, not requiring the client to be involved in locking.
- Add a patch constifying dma_descriptor_metadata_ops
- Rebase on top of v7.0-rc1
- Link to v10: https://lore.kernel.org/r/20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com

Changes in v10:
- Move DESC_FLAG_(UN)LOCK BIT definitions from patch 2 to 3
- Add a patch constifying the dma engine metadata as the first in the
  series
- Use the VERSION register for dummy lock/unlock writes
- Link to v9: https://lore.kernel.org/r/20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org

Changes in v9:
- Drop the global, generic LOCK/UNLOCK flags and instead use DMA
  descriptor metadata ops to pass BAM-specific information from the QCE
  to the DMA engine
- Link to v8: https://lore.kernel.org/r/20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org

Changes in v8:
- Rework the command descriptor logic and drop a lot of unneeded code
- Use the physical address for BAM command descriptor access, not the
  mapped DMA address
- Fix the problems with iommu faults on newer platforms
- Generalize the LOCK/UNLOCK flags in dmaengine and reword the docs and
  commit messages
- Make the BAM locking logic stricter in the DMA engine driver
- Add some additional minor QCE driver refactoring changes to the series
- Lots of small reworks and tweaks to rebase on current mainline and fix
  previous issues
- Link to v7: https://lore.kernel.org/all/20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org/

Changes in v7:
- remove unused code: writing to multiple registers was not used in v6,
  neither were the functions for reading registers over BAM DMA-
- remove
- don't read the SW_VERSION register needlessly in the BAM driver,
  instead: encode the information on whether the IP supports BAM locking
  in device match data
- shrink code where possible with logic modifications (for instance:
  change the implementation of qce_write() instead of replacing it
  everywhere with a new symbol)
- remove duplicated error messages
- rework commit messages
- a lot of shuffling code around for easier review and a more
  streamlined series
- Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/

Changes in v6:
- change "BAM" to "DMA"
- Ensured this series is compilable with the current Linux-next tip of
  the tree (TOT).

Changes in v5:
- Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
- Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
- Added FIELD_GET and GENMASK macro to extract major and minor version

Changes in v4:
- Added feature description and test hardware
  with test command
- Fixed patch version numbering
- Dropped dt-binding patch
- Dropped device tree changes
- Added BAM_SW_VERSION register read
- Handled the error path for the api dma_map_resource()
  in probe
- updated the commit messages for batter redability
- Squash the change where qce_bam_acquire_lock() and
  qce_bam_release_lock() api got introduce to the change where
  the lock/unlock flag get introced
- changed cover letter subject heading to
  "dmaengine: qcom: bam_dma: add cmd descriptor support"
- Added the very initial post for BAM lock/unlock patch link
  as v1 to track this feature

Changes in v3:
- https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
- Addressed all the comments from v2
- Added the dt-binding
- Fix alignment issue
- Removed type casting from qce_write_reg_dma()
  and qce_read_reg_dma()
- Removed qce_bam_txn = dma->qce_bam_txn; line from
  qce_alloc_bam_txn() api and directly returning
  dma->qce_bam_txn

Changes in v2:
- https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
- Initial set of patches for cmd descriptor support
- Add client driver to use BAM lock/unlock feature
- Added register read/write via BAM in QCE Crypto driver
  to use BAM lock/unlock feature

---
Bartosz Golaszewski (14):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: free interrupt before the clock in error path
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking
      crypto: qce - Cancel work on device detach
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine

 drivers/crypto/qce/aead.c        |  10 +-
 drivers/crypto/qce/common.c      |  20 ++-
 drivers/crypto/qce/core.c        |  41 ++++++-
 drivers/crypto/qce/core.h        |   7 ++
 drivers/crypto/qce/dma.c         | 175 ++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |  10 +-
 drivers/crypto/qce/skcipher.c    |  10 +-
 drivers/dma/qcom/bam_dma.c       | 254 +++++++++++++++++++++++++++++++++------
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  15 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 459 insertions(+), 100 deletions(-)
---
base-commit: 84c5cd8a9fb10675b694baa37094a3429d907fb9
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


