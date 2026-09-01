Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3BFC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=; b=ZZcYao4LVrU4E41g1pps1/nEJp
	z6nYxqkjSFljdd3aMsjojk/Cg15jztPCjqvph5SWHS8ybmgkX89iS3e2qlSVESSBqQDTLKw+sW89B
	UHDoizQzfUcIXkV6kNwqeaOECj+9W1W/r5BBtRGaeEtDHuaG1CnSJWIAONqApdcLYTJZN4vkyYjCO
	zPghBROioGjSrF+KkAlZujbsQTdGk7rZIDUzUwfG+dhVs5xgR0qtzWsNemPQ1uSqZiOUXdHBnU7lM
	bS1YGjGf8j6+2mU6YjX2k9pgQPwRwQTukFaH+KRytm25jySuEOxPiBu9y+BwUDzfabRH+En22aJKU
	Atqgw+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QWs-0000000CWWb-3yG7;
	Tue, 01 Sep 2026 15:36:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QWq-0000000CWVr-1bd2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:36:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8cii3913697
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 15:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=; b=o1Z/ZsVc8EwHXYoL
	N/X3jHclM9iGocpfX0fLEQm7rWjghERgVeEDRL2JdObPCQonTMvGo2VJNqRfmXz1
	zVmx0uD54G8lm6Kpbmlp26Ddp8whLa2aOM4/zdOUtSTw5GgDhdIMkXXCGajKUYe3
	YLp1WWYJOjx2XHEireOVzIBvS89PF/VIVXg3i7Ek3edaqx/BrGTxSnfuAABglWbn
	T9HxxiOv661pkDs9rfa55PMvrk4kljk258zvuHsylr8MDLwCw1JR+XT+L7oNQG7O
	JLNCR/EanM3qciuNT928O1/MN1b9RQZKyOegz59DaqtBhZhVUtVMdUCC7nEO836d
	x/2NmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu2dst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 15:36:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1563393a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276963; cv=none;
        d=google.com; s=arc-20260327;
        b=FE4EanJdPnIF98Bjn5Md4TOlASpWzjMkpvlecuGp2C8AmlOnnHvKyJnAhfLey2mOHS
         kARbrH40pqHdZpuAmknCfH9d8U7E7a+Q3XsnTIqhcC6zpbYLIQ1GkUDWTZnXpyjVhloM
         19C9gqjSURIIona2tTmQJR8UwOHjOBm2cHRcPkvO0o9bnyuZbA9zs+ZlOtD/LE9CxfeQ
         e3FAFDF7iFtEsH9D3zVG01GO5F1d9RmYBqWQdaZSvR7CpQ6QyaRs2jJAGvvjA1NYMIyP
         FIIEnQC/6S2e+Jg+fX1AtCxPDh5KYN2lhaKnfWlqwCchZmYGMGDfcf+yiN2ILtAEx69E
         eZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        fh=N6oZB5aAatlxCMaj90r8nnffDRJPe+JC9l0FFkMZPZo=;
        b=XV6Uap7eSOjwoTNVCYX8txlmVVk9vFRGlYj9/o6SzzmTQIXCdqww4VugROPl+ZSZOF
         HdAUz/26zGXOdwjOQp8P+JnoHUzcji+PyPe9nBtfllWpUbGnfS6e9jKzO7rWJUVJpXI4
         AgkiqBRWGoRRQjwi4nivWLfhgJit/fv86JOf4XYheRSj2blz4pM5c41nIZkfHz/t7LL3
         qOt2/UEu7Kk55hBHLJhkR437BWBerbH3fAfuQwCjepZdUaaea5fpJO4zuXGqbW9Ob7EV
         oFwFfgMWkx7ozqM027GVgwqeSe7cTGYUO/H/RKWvobLgor0NIBsHwytygVgFjOUSkOOs
         Wf0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276963; x=1788881763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=Uhka6hPJHceQ5yPglN/iiiCVUxoMwp5NkB6gXUeuMUYaXT8BmiAwIvudxEKndrdwXA
         qMeBY9W5PAMa6uBx8k198OoCHEhqJT3Mz82SgfiYYdgZsubkhQkindhGb6MK0bhAY9dn
         4ZuoJ0zoSi37P/4rLB+Xvl7BFoRDwWFiRjvm9lgdNxJPD8aihjpFCE7h/ySzcQRcQNtW
         0xe14TUDt4+iG3SvG76SQEadNMDD5SGhJzGB7HjR1sgd9GmVhUQKxrdSW52w7VAFdiG0
         vLaYZ3Zh+udemktmUsgz1cR6xn6EgJtjlE1K1xA0yvnL0weBBaTmO8cWOPfs86HBz4Qq
         0ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276963; x=1788881763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=ouwHQ8qWCA9/TKgUWximVTlA+DRjO0/JI/v5hklwIK/i5TGMMJ7P56RvbOfV5EWrCX
         3tCAD4t6qViQoDF4xomfVmsFBuGllf+eAcpmHTcwS8cgoWuNKkEN3AgLFVBIdtBlyTTL
         aO2epOhEXPRN1IIQw/23yQsE1rPD4qdgsb9QELdTOJUDoLz3jsVcSwPuQSp90uCaOWuA
         jb/9/0uAZy12c2bt+cmanY6ZzZMpmWUOtzdIzfoZVGooSQeoGJHsCyCeyEpF9D4xpGN5
         22JNpVCC65h48MxpwlV5M2UNUOsXw+9Hj8hAIb7Q4mgbNQRUeeBTT/o7n+0wCaR4tEjh
         auUw==
X-Forwarded-Encrypted: i=1; AKwUvByhOovt2jDNowhzSXG1BsC6XHQKO83t5KoLEuYP9qXEi4yTw+OvPWVvJlrT5qIqqNVmMyBHT/XduAP1A90L82H6@lists.infradead.org
X-Gm-Message-State: AFuF++lXSYY5/ciSN1tbTJDpETI+8sZujo1GlF0Ti4jfhkESxBH5h7w8
	4DpJ1s/EWbKPb2eoH+6hvBektFyCoPrJmUOX0ujgb8FhtnY92yRpmW/o8Xr9oMv6Z8hfKkln2A0
	jZxkuKaOPcbjQpIZo9fwzJhKvmhvPR5wFN0lypgffx0csq217KyrxzoIE1lm5GYGdSDWA6dLBaE
	C+xEdup7385pMssk0s5sM1nYQmLsyoam9B+eLAa1khiQu1CMj017Fr
X-Gm-Gg: AYBFou2EchDn0nvasDEriwLuZURQWxv09Z6q4iYmXkfAY/GBap5z+MEnxldVZ33We9c
	5aaWjnb7khQO5b+TwnDcIIBnB9DOn+zgwQHbG2edX1SgGhIeIJbSD3L1Y33WrB2BH9I+sZAbTHW
	aQYyM7B9WDzKOP3eIYOM8nqWkv7I7MAzDKSgszWerFAV9a4irV7YpK5tppbw==
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr53079273a91.8.1788276963090;
        Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id
 98e67ed59e1d1-396d0e7255bmr53079149a91.8.1788276962567; Tue, 01 Sep 2026
 08:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
In-Reply-To: <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:35:50 +0200
X-Gm-Features: AcwNN1XR_ENRcLXIDuE31pwfkZ-t4Y_ZQM0rZSm5dxDSS2r51n9kmCfdHTv7uZI
Message-ID: <CAPx+jO9ijNO7R=oOXs+yd-LaNaVAPwF1Rhh-xVGr-s1K1Fuw6w@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfXxQEKdLTHQOeV
 tzGWjr7TKrbM96hI99g6q06I1N6l5nRJ6Q2EkWX5dQbcdqbmgTQFEs9Pqj20TMyl/Oh5MBKfVkM
 jFHY6NhX+nbvwBCcN1b2ELp71Kd9Mz/8KgWF1wijWMog+Bxw1wHeTlrkzKzvJaakRXKDafkpqvW
 mS4iHMw8EPSPFqmx9Z6knhubZSYM/332WtRzjo05/GTuLmAlKJnKqB3YFp1NPzyhBjZ0hnoFY2R
 GPZ7IJsgUwsqJxiEqSGIgL6D0LKbjyYkWipL7ZWXQSyByRuSM7rS6a7mHSWDETHtsxPPTa2rs7L
 KfCX8N0u7XadsMW41qANcr7SnwWsPMJ/tPh7x1L6fjOwKMsNHZaSBl4/LjL00eRfM7EGQ9Lluur
 NfDg+VTiNRbrFSiOZpJaRuNLcPNKixh6W0h62qrWRoY7F0fSAC0IrDexCIAeLSfAFL5Z/TB0PJL
 fzh4HDZNEg990XHI/AQ==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96f0e3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=elWi3GNyyhLokhY1Yp8A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfX0GP/fcdF/zg6
 +Qw5WG3rwD7ekZwIRG5muOwDx5u5yNrpbNmy89YereuR8JmhJJwGj39OAKBDJAk3VYZLdgl6mJA
 3kSSuwGafHHjOEN++ksqzm9HiWfg07w=
X-Proofpoint-ORIG-GUID: T7uVNADyDVs-R3d3qaTT3lgXb7EMyP4r
X-Proofpoint-GUID: T7uVNADyDVs-R3d3qaTT3lgXb7EMyP4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083604_429184_137E37EE 
X-CRM114-Status: GOOD (  19.42  )
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

On Tue, Sep 1, 2026 at 4:09=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
>
> On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> > This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> > IDP reference board.
> >
> > Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings =
up
> > the essential SoC infrastructure required to boot to a serial console:
> >
> >   - Global Clock Controller (GCC) and RPMh clock controller
> >   - RPMh power domains
> >   - Interconnect (NoC) provider
> >   - TLMM pin controller
> >   - PDC interrupt controller and SCM firmware interface
> >   - Devicetree for the SoC and the Kuno IDP board
> >
> > [...]
>
> Applied, thanks!
>
> [04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>         commit: e304e8919043712191462224ce9d40bb5f5a6bc1
> [05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>         commit: 12918d595ac96b819b9c3ba0df4c6a4bf50c43a9
> [11/15] clk: qcom: Add Global Clock Controller driver for Kuno
>         commit: 7db06b5f624b583fa2206f98de8437819acada9b
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Bjorn, looks like patch1 is ready for you to pick as well.

Kind regards
Uffe

