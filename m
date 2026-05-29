Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9354CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=; b=DW33yL2Sg/v7KUD+cQD/7/ZueG
	AYdcue6F8xgyTQEWo/6DprNBEUSgWKMK19reOK7RmTmYZ/dxLRbHHrl8RLT73Pc71bnMoNqqEi6mx
	EvCXOPUCTLxd08uZvgbb4yNr2AEt+MfzJjvbhe2Y+ngZ87wf0kcaqSC9sVrpOvyEOSnGU5tTKXvSf
	VLJkX24DxUMA+K8i7u6+QJglU5oqGAViU+0Tt/UetG/wAlQ+zfBkSMsJA4O1qu0XXJsSyJ8FP/lTC
	aWQ630dTTGpUMJ70OsqcaWWh+BxDjTr81FoxsE62PoF2FukDVi2dSf78/QxC/UiZk8XgVZPzYJ32d
	SYy+e7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw2z-00000007Lam-1StD;
	Fri, 29 May 2026 12:10:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw2f-00000007LSB-3WxX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:10:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7WSWt1495154
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 12:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=; b=RRzFHM6cekQZB+QT
	YsJaly3UU4j8wdtqTG00tu9CqE4XqQSMNOZno4518QluS/gdD5gHi9Or+KS6VZ5g
	l4pG1REEHirObLR1qUet6lJx+uEAS/W2JSvIPuaco0IT1rqoKWJ7MXornqkMeiTf
	2GjJf/uZcBOFpyNWzXOBAchsscEFzBSXhURutW4rfdA/7VFlFKt0IQvvPWhaSyQz
	Cv5kCIrSAhQKVhyz2TQGCinJBB65pk12mdH+e7Aiz07zoDymSrmgATpLY6BEDAgl
	s8RNlWD46DU1jsjjvyNO/IhGjcoXlUuqg2MYo9Dsfy6eg32QP1RJJLQuNh3yxJt1
	YWQQOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015ah85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 12:10:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8badccc9194so102423796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780056620; cv=none;
        d=google.com; s=arc-20240605;
        b=k70K4rFNpu5fUMc/Cze/HIrkYhdyQdTa0eUUmkoVeu/+xc6XCkO/sU/QOqqSxnQ8dM
         3Fq1U+WCU8rIqiYSKBizH0EXTsTIr7XrkTu9FFlmR7fQNHGepupcbFJBqxl80fd2WeC1
         ePt58E9aE4+fcgudSg+eVslOBcBd0MlbNm0/JlzFExoySBTRQELOwI6HyM55qOunsr7m
         eyYMmfMUcPIB7/86/vElMaL8U3UE295i2GEOVoAkpaBOS2rT7Kdw3SPZX1p+J8+TvUNc
         /KzFwRoWMx/9JemUTetDmmX02yHrbtp4+qWbz+L+QxhhOLU+i7Y0gSQ8vWXRvapEsxUc
         wmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=;
        fh=L9oJOxafhFTCBR6AhoQ/ws9twgPpQjWWf13l4To96Hs=;
        b=OZgOzwsgJtJbFoqPMev8idbYhENptDfVuqf8Mc5IO7IxK7wAbT2BNsHmdW4IsQR2mj
         komcQf2O0/Ad1U2I2YkLJol6qS+JUNT7Y4tCcRCvbI6FyE+bEV8VwpUd4NPoNasZ3TsA
         Y2kXjJGbAS3PIr8/63RWERCvcxrfI5pGCmlGtb950fcZ1rNAMRzBh0lzfQGxfGk88XMU
         0mL82+SJ8t32LqBJ4naUhDvJFb8Qx/XmHtu1qMLoKzs/uEG1DmTeSnU+3bk+9PY2RBjX
         T1xpd9U2vcaaOrpIkYToQ1XkWGs42t/Bb5sbqNT0qsiVj0esE6v4RorJ6vtXjlRGEZRF
         halw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780056620; x=1780661420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=;
        b=Bd6jcQwVQqHei3Dx0nfGMvrwLD9o6W/qtyf9F6XTb0J/4CSTyU98H04u3aTADRe8tO
         zHK9PJaxCnEe4Rl03Qf95mNg0XBCCLcwTj39/jbIbxRYv/6BxW1/lUNeg2dlk0oaVKRr
         sOqhZr55Pd5wlF93kZLwKiqdnQYsRSO73oB4MHig/kAcaT82Tp8Cqp/rfR9q7nQJbDXi
         Msmbm17yKCjbGzdf9c9K4lo3ZsLLS1wWDhvRntf6eFqXNAtyAb/XLvxd2yHD2rivT+4H
         6/8Iktre7f/aRoPQOH/qiyp7yvereNiopwh56lKvz8zzaKtOo/5RIaFAztrGSJSe3X4N
         brPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056620; x=1780661420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=;
        b=K6NMG7sZl0jgQAaf2kJU1z6LJv2aRbvSpBMi/ZQuf3LfYsrtGbc5y/WEW6pm9YiVw+
         lGPImwxeVugi/4VwKcLLKYyouzPWS0b81XsvMQyk7106G9ft09hzwKkl8NIFFDKtcCSF
         ONGAEMN45JqyBnkZOm64s8dnS5uyITPB4hPiPOSVwLSkxgxUHLAQ45F+s0Py4N+vQfF3
         ZFT6jWT2CDYAyJkXTiuAE51IqXj+O5MQBjIhN+jJDLWyAyd20JQgwe+ynK3qFRZhqpJg
         qzh40gIQ1bykRu6CdXq3NKWGqvEZBpCETi8K8AViWljMxmIQJ6aqg+fXCfbG6G0snmYK
         H37A==
X-Forwarded-Encrypted: i=1; AFNElJ9JpaHxhQGtw61+ReiNsBJj54snxSHHp/rfIvWoF2hW0A4ZYOMO+6tk3AtkWR/zmeVp+9JTw/+QQWTuTdgbbC4n@lists.infradead.org
X-Gm-Message-State: AOJu0YzxeENhiWCMzWmY8JruaLoEbJgXsromI4pWbvNYUsdlZO/BAV+O
	vXFV+ATbwy8YfOMw/RR5skEsSTB3XQB4cdb334oUfkUGqnlSfOcyC/a/uriFNIIE8BYlvS26xaf
	QfWNLrO9itPzA41BMSDCQ/q/AKhc7SyIjFuDvSK8x/Zj75YfeZZN0OYTB2yBtQKHUy/apVWEgru
	HJ1fA2Xq7wOv85NmbqHD6bCUih263sR0/m1Y/qGCxgvWYJtVcvXSOF
X-Gm-Gg: Acq92OE4zmaBkdU0aK3JlmWZSlecJ7FZgNZtldHce5s2O2Lvhc4yuhwfk/z0yn8UHtI
	c1h90YiOCIPJwTM5jLIsLHsCKFhGYrxC/pu39sV69cQFETmO+SUShKd/DMFW6n7H21TEXHh7daI
	4vHWowwI0xIOyqI+FFz3UXQrrtZGHNFz5XocYDquQxXRflgRKBHKwIOaP+JvsxVQdsk0WlzFueK
	LJ961IwzSZglwu5NQ==
X-Received: by 2002:a05:6214:e88:b0:8b2:138d:32e8 with SMTP id 6a1803df08f44-8cce7fce689mr30733566d6.21.1780056619476;
        Fri, 29 May 2026 05:10:19 -0700 (PDT)
X-Received: by 2002:a05:6214:e88:b0:8b2:138d:32e8 with SMTP id
 6a1803df08f44-8cce7fce689mr30732946d6.21.1780056619051; Fri, 29 May 2026
 05:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
In-Reply-To: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:10:07 +0200
X-Gm-Features: AVHnY4LU162OOxc9tFfE3j5ZpvhE4LA4WVgEbnaL_F-Mscjocx7-8n74YjsKkeg
Message-ID: <CAPx+jO9woUB9VGUx+ebWD9oOhqCwzXL9=41MEesnWS15Nyr66g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: _P0lBkx_ZvS6JQO2i7Y0a87Khrxu9dlY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyMSBTYWx0ZWRfX8yeWDq7EpQn0
 +P2v25v3RDP/wiZSimDRTc2UGEfS/QDdS9sBh5DKiNfKmPxcBBAlpu1P7phzejhgcO6wscAhchq
 0GqpXUv7GNWDG0Axj6TxGoGoQMal/fHGGMVJSdJY0usKu4um3qWcj06ETuWi7oGwSbEKciDZ8b8
 +QkqRnnGg7wu1fwILPnxtEF8cqfcX9QDzC1TGEywibgcSta3EzMHXf1T605wa6xbwdabG+sK+yi
 i/yS3XVPgn3J+zlCs4x6NxPgMdgOw24smp4VMA3GES4ibTk4XYpNtaw1pALy2epsNQRs8FGpfvk
 KeN2l+Ch8tVXvd17QJRR54umEUqLzNXlVkr5zLHaZdKSQwbvtyWu6+mBdxwb4XriMHLrsv/H/Vg
 6t+YjtlY2hUCsdRjo5AQGuVyrur4RnPQlgdgjSmdjZ6OFO9BqABtPVhsuxuRXmOP2FNnbVUUTyT
 LxNccplVRtGcCRZvh5A==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a19822c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=xZACtGnEiovJ44qPjMEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: _P0lBkx_ZvS6JQO2i7Y0a87Khrxu9dlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_051021_904922_A0BD9159 
X-CRM114-Status: GOOD (  21.93  )
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

On Fri, May 8, 2026 at 7:23=E2=80=AFPM Charan Pedumuru
<charan.pedumuru@gmail.com> wrote:
>
> This patch series converts the legacy text-based Device Tree binding for
> STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.
>
> Note:
> The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
> depends on the patch "arm: dts: st: align node patterns with established
> convention". If the DT schema patch is applied before the DTS
> cleanup patch, `dtbs_check` will fail due to the presence of the removed
> properties in the existing DTS.
>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>

The series looks good to me, but awaiting and ack from some of the dt
maintainers before applying.

As the change in patch2 for arch/arm/boot/dts/st/stih407-family.dtsi
doesn't seem to cause any conflict from soc maintainer trees point of
view, I can pick this up too when applying.

Kind regards
Uffe


> ---
> Changes in v3:
> - st,sdhci: Edit description of reg property. Modify reg-names. Add
>   "minItems" for clocks and clock-names properties.
> - Modify the commit message to match with the updated changes.
> - Link to v2: https://patch.msgid.link/20260503-st-mmc-v2-0-11ae3216d2ce@=
gmail.com
>
> Changes in v2:
> - Fix node name in DTS for the MMC to match with the estableshed conventi=
on.
> - st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
>   "clock-names" properties, include an allOf with $ref to mmc-controller.
> - Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@=
gmail.com
>
> ---
> Charan Pedumuru (2):
>       arm: dts: st: align node patterns with established convention
>       dt-bindings: mmc: st,sdhci: convert to DT schema
>
>  Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------=
------
>  .../devicetree/bindings/mmc/st,sdhci.yaml          |  91 +++++++++++++++=
++
>  arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
>  3 files changed, 93 insertions(+), 112 deletions(-)
> ---
> base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
> change-id: 20260327-st-mmc-c906ad95ff83
>
> Best regards,
> --
> Charan Pedumuru <charan.pedumuru@gmail.com>

