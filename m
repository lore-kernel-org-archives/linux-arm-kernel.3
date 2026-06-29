Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F22CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DiLxo5X9butVvuPltJCx5qrHl55sLp0zJC+g7r8kbbA=; b=AcZKECCUAnZDOI
	YYaQVdQ5CuV1/PX1HzWu5P6A4qNictYhkbWttLv1UxubNVLWAwh8SFBIQ7ki2njbahCXUGcMBsL5G
	Y5/UOd5z46USo8A/PmISS2JPnDvFKEZhx1G6R+KMSPMEXBcabP0Xk325XrD1QtyJpG3QhFvrmOJnX
	6S2aecnQKmu/hw2K631An0Utx57NpNffnLoNYYM8Ko4TsV5LzkiE76B0v3NBi+P/Ac1DPRLp2e5Gs
	DlL339hRfvBUUx0Yt+GZ8Q0MR1BumjHvwCtmJ5KOg3KZiycWkwYoeSHalR2fY4Jkzo490sd7BZVK9
	3IAkC7LgDH4E5gM2xhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8o2-0000000EHHp-3jFa;
	Mon, 29 Jun 2026 10:01:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8nz-0000000EHGj-40Th
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sKvf2143078
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DiLxo5X9butVvuPltJCx5q
	rHl55sLp0zJC+g7r8kbbA=; b=PTGGO26Sc9ucc9yaE5Q35D3okV/Kg3PoBHCdE2
	9cmJxMGb46EDYCOEq54tMoTqOHohJcs4TD/jptbWJqlDUAwNLSz0ZqLB0G4waSCa
	zpCObqCvTmtWHQS03FCCN+QHfFmVIIEaMboSzMT4A7wdg7TJAAM2S28r5ekomZP9
	HeI2EaUyIQtQ0qewEpvgccv2uCc6325FrSx/y4irWEc9U36Y4SS01mCldlK4jy4m
	W5jwSC4rti94kDgVGYwlStbUgsJu5q3zRL85jzybn05Z4XFZp3aalJSBMH2H0p9d
	fvaqHd1G1VtOhHGxK1+xsHpWgnSnGNKQ3ceBhlHU+7n2lg6g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nxee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9693878131dso1931878241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727290; x=1783332090; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DiLxo5X9butVvuPltJCx5qrHl55sLp0zJC+g7r8kbbA=;
        b=E1OoKRnMsfn96W3SbRkWlwGliK67AjyCzvhkXd62zjzF/oartNOu43FgS8Pvs4it4N
         fPFGIkVnmFUYwZc8kb+D9GaoQR6tc1l2s5ULKWebyuq8C3Oa0MUt8TuV6XQb+tzMaXah
         kPVR8aSPpoPaiEGAa+hQAuMwmmgzkexzT+QfXvzy1OfsadefyagkxqUInv2icjgk6tE9
         hv4/1qAIGKCLWVOcE1Vz6UyY3plU8Sq9RJPzgRa5WmhnwLXmm0ILpB+oBPN7MXse3BXd
         YFxZb0z5TMCNaLoETPQpdiQyrdY1RLXutf0u6X/iYa1i8yw+yxV9PK1B5aCjc3m8DRjN
         YRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727290; x=1783332090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiLxo5X9butVvuPltJCx5qrHl55sLp0zJC+g7r8kbbA=;
        b=mt9v9zKB04Toz4mVTDPVFYj4eBeh/q17aZ3hS61qKwXwHYUnLUYKvFyt3mTwFTYQfI
         XxxBD1gH1VnLRn8eyvLBzDAgVNV1D2B31rpTVAfU3fB81n/B9Swcb4QnOxF+gje10G1m
         ElXI59U9jW/nMOYSBRpH21U8zZLg2OtMoCz7S94z0WtEYcnYtNfsELJ4MmUcp1+bdwjH
         o/iHDwEbWSROahAmbOL0O1iW07LW3UEqV+b9zpQQ4690+X+bIbCx9xw6hh9fD5Si9TGL
         puuhoV5nn0b9PYhNcqfaRkdA6fjinaXlJ9nQK1JlfQ6jfCfBMGMZaq7rIcGywbmZr7Qk
         2Buw==
X-Forwarded-Encrypted: i=1; AHgh+RoUJhevNbmam+g24G6gosU+0Kz52lNtKkTLgdq1Ed0QsdPvmP2aH/CIf/UmgN2QSDjKpTQFZPqZqPhD6h1lyeh8@lists.infradead.org
X-Gm-Message-State: AOJu0YxHt2zmZDKPtY2tZVlX2BkyqB5uXS+H6Kb6vu2MupA7+2VFqwiv
	UbIdAorR79yF7akQRDSOvPw/GM5nMqF3/5lKpZHEoftyGrnGP8tLqNaqz11UkHPdfBa/k4D/vcF
	7AxqUcqT7I6nQd7NBs1/IS4WAStxm6gQI4QXZb9AL63Gn+nG4sPXV4mfZCn6ohcHdwUITpBRLwW
	fS6Q==
X-Gm-Gg: AfdE7cluc+RZsJIp1u0l+3YAUCo0OodMkzGgLQRstWKYmM1dOGRFmMkDqRc4jE+E3nJ
	b5eWOJACNVXmKft5JepK/2CXBty3wufXa4lrO1598Tu5I4EHWetfLbFJUzw1h2gVET63WueRYyn
	rQnmKpF4eps0b3WOWzf+6dymJeTPH19mDJsVA/N4IMgflMqRia8kvoEh1a4Agt2DQ4Q0YQiVQ+q
	7IJKTNzN6wK3pXt81oPaE7R6VArmawLWqxUApcvV8I2BJZvuFUdsOOUZSMLL6PzvnjkrB12JjRU
	zasHR3DogobeskpYFeN3Xuvo5y/lupFEV8dq/n6N2cIKExOj22okXzk/lVRIRVrFyts2XligOz+
	7oBD3gWxPzHqbwc5TxFI/+6QFqiUHvxu3rPy9oTi9
X-Received: by 2002:a05:6102:3748:b0:650:94b2:b214 with SMTP id ada2fe7eead31-7342c43f8d4mr5283852137.12.1782727289654;
        Mon, 29 Jun 2026 03:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3748:b0:650:94b2:b214 with SMTP id ada2fe7eead31-7342c43f8d4mr5283466137.12.1782727286173;
        Mon, 29 Jun 2026 03:01:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v20 00/14] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Mon, 29 Jun 2026 12:01:02 +0200
Message-Id: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9CQmoC/3XTyWrDMBAA0F8JPtdBGu095T9KD9omMSRxI7emJ
 eTfOw4NMVQ6WKDFT9LM6NpNuQx56l43167keZiG8UwdYC+bLh78eZ/7IdFABwwU50z0lzieqMl
 9PKU+5SmWPqrsAueYNXMd/fhRMg7fd/XtnfqHYfocy899k9kuow9O17jZ9qzPMaXoQdCnd8fh7
 Mu4Hcu+W7zZrQywVcOR4bxCA8E6A/DP4OyJAHdVhDNSEE2WAU3ySe7GadpevvyRFp+21PxZ/GF
 pJhjULU4WORxVCtIyaFmwsugAVQvIEs6iMAg6I2tZYm2ZuiXIYk7bHCTaKJuWXFkg6pZc4kWzH
 iVlxjTjpZ6WbMVLLRm0QQnNKQPJtCy9sqBxR71YUmHi0WMIsWWZp6VaNWHIUsIrpySXwbiWZVc
 WNO64VLpz9Kwc6OCxeS63tuqPhi8Vz6w0gCkGlL5i3W63X8H2JaTyAwAA
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
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12727;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5UClFUpFD2cBZbsLdWJR5rmjbc/5tNzzqVKkpQH7pc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJj1mMnWSJ5ioOPHQtqCSCbxHsGn4ZX/p7MZ
 kx4ITTBysyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCYwAKCRAFnS7L/zaE
 w2FgD/9aTEPPrnzaKY27xuIpVcVIZdpmhp54URuKyZpCqhgfAAPWvxIMplbC+2mirUn+rLUqgOO
 xbuyvcbdNc9UAlwcazu9z6oQrxaOlusVx0zrcNgmCFOW1zLIPm72BimFJOVX4mEF6BECXTHazQk
 nQDA25/jCwNOvvPk6XBG8FNX02IuaPQsPAxBbDtNOrpQYNoX/qPs45+RagJ1sU4iH5m8l0g45Mo
 fXcywH0s7KSjvhqw1zSowvF9GbA6RuoPFQEFrtrbNetcANgzSsoChGFczj65MBHkdo6Oafg8z7a
 RFfwfCoZR/y8N6nJgknXGwrflCwkQdKBvhDNfuP67sOWqkhHwI2tyDEOV92Y1xJDMoLetoVrQy9
 gkNztkNcHF5A2OaWYSiREA5snT1IJVVF++aHLsDADynwuEC3ZjifEFJgKNgbyiysQbWHg/UzdLf
 QFw/qormxrOAGB7z9V+uJJLIo7Idrnv8tuRHU92DywapO6Lsd/sJA56M5BXNJVh+FkOV9stUGuE
 wBkgq8a+zoCl+c6ZuAcGrx1om5GIIaeZLkzzxlAItiS2JefGlGicsfP8tWXVvdA6tojIcRrWjWZ
 RFZG4hNDPnkvlNqGxeHRKcbV8fq7K9gpXhqeF9nSyt5lQCqC40OEstnf90qHLTIWzcbemb501LS
 4lwAGxHnD7PZXPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX/7n0ps0Yc9pw
 /Nk8avBf4Bjr4av4kCY4rcdS4N5hdrboQbtv2M9w7IPThX8qVHx5xJAB+UNL60HU8RrVxoyLi2t
 CEWt2ZOwxU2GlKuM/hHfy4++GY6IsD8=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a42427a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=mYVGbHsXlysWdROdmYcA:9 a=NpY6u6IGb6b5TAkS:21 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FAfCUreiVXOWaFogltDbbLYmZkrd_jDg
X-Proofpoint-ORIG-GUID: FAfCUreiVXOWaFogltDbbLYmZkrd_jDg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXxDnaix6pWaE2
 uJ4NHYGfd28ZvBRsD4jq+eURKtuxWVbiOuNUpvFO2O0rXpoh0d6naW9NJfqg7iGOzKIscyOhjYO
 uiUBtAsqg9HoVfj7dN+5yWr5/OmXzMwSDujLvd2dz873T6Z+4kqhtJm6Kvqa/gzT5zQFbJJ1DaN
 7yDhFJ8ceDcTVgfvLfRT1LQTJivJKtbV3uKWnhfYMGasdkxqXPWQhXAs0FSzmYByN1dEtnCfdmH
 kA9U/hFTMvuPNYiocFSVc8se+SxInZL/pjOaapB5JP8lw8tKke4Wm4YzAOgp5v0mh5ikwkKCMQU
 lnl0ceCLinbt/zR5rGA7PWHXPMp6h6CqGSvT2VCOx4ILQBM+nyB0IThX6jFhVCp0+oYA8DMY+/U
 W2pWq9lncT3yx+dtiAQ5jz4WVpCHNI2xTV6Jz3rcPmu2JhfJRsdnSfQldBZpWsYBErCll8MZxKl
 RMCvZbsHGYSWyJO2gmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030132_132578_6A77399C 
X-CRM114-Status: GOOD (  31.95  )
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

This iteration addresses the main concerns raised by Sashiko: abuse of
the DMA engine API with wrong usage of cookies and FIFO-full
rescheduling with locks enabled.

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
 drivers/crypto/qce/core.c        |  39 +++++-
 drivers/crypto/qce/core.h        |   7 +
 drivers/crypto/qce/dma.c         | 173 ++++++++++++++++++++-----
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |  10 +-
 drivers/crypto/qce/skcipher.c    |  10 +-
 drivers/dma/qcom/bam_dma.c       | 270 ++++++++++++++++++++++++++++++++++-----
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  14 ++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 468 insertions(+), 102 deletions(-)
---
base-commit: 80a4205b805dd461d0a5b5c684079bb120df96d0
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


