Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA52DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=; b=PkP/jh3ILuWh9VWuI0xjGdfmlW
	dp1RI60RKaJwPmXeN7OawNisdxPEOe8nz/QupwdQxmejXGKUbD1xdITsvIdUc4S6QoJ3ZuwPusduS
	Xd32HfBxphe6d4fa0g+9Gj/eRIFWSajc2oh9pWWfvLAKN9gvi/JtqZ9wUfxnFRMNK08I77X3oka6n
	PmQNxgRhWF28M9xOWrtwdsPafskQkjnz7AP3g7Wa4kTwaCIOM+6nWx5C1D1zRQASXIDBx+rzGluaY
	tv0xDrMZ3yD4+Jecq0yAn9nWG9GiIWHJ/ABDleZ7yvh7pHf/5FMjDNlo4iGv1X8jg6N+VYpGsOlk2
	QUQr0LOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUgO-0000000HXrZ-2WmM;
	Wed, 08 Jul 2026 15:59:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUgM-0000000HXqo-2b7a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:59:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3McY2579480
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 15:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=; b=XyA045nBOM5EH5Ke
	LNkFrfA9nQDJlcveGj2IHyeLt/bwfZVepg2Lvu1e8orRvbvsxiIi7z8zdI274WG1
	boey+aCihWfvPW4e5Nw6dcPx4Vj8dz8y3KDI3BfCIOP9AKlfSYhb48poQ21W5n6j
	gzaStDxvYVKkgOiRbEePjq89MlTbXpRjCEYHnTemwLl3whXN7lv60jJO3ClGjege
	h92FRnTFNsKKDVA9IbE/vq1trLW3UwOxTMH+GILaJxgi77uiIykYMQLx+zAiEJ5B
	tp8+/n+37p6V0FGEd4wpGQ5aC+xKz2KHp7F59PUEvOgGcn+nQivIx0OiMkAUKtu7
	8jOAOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gbmtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:59:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e86066fc53so163216d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526369; cv=none;
        d=google.com; s=arc-20260327;
        b=MaM0zETMF4yMi8UhxnxlGoT7x2OE2J0+QxUQYlV5+Khgks7PyYFOOoBQlRmDMoszTm
         sbJ1UQsnvfN5XcuzWzjkcBxOe8DVXBFMTbJ/76SASe77+orGUu2O/pGOdgke3Z/xGY7n
         7xuSfDHnGwH0vY1n2i7RpNJchibmEbik9DH2MTGi6QXBPLt9H2jii9gks9dZmyePTqsD
         CKBxd6ftnROXP7lBe9bKYFMOMdlp5EtXvQs8ZbRniMTiE0s/N4G2d2CxTDDtoWP6pxyF
         ZygbLojxeOtgED71wstkw5UQc8Is64hbvLGQs8jT37POROs88cFM8oyN1FYoM6x1GXTQ
         nAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        fh=nXxk1SseloWhATlgdUYaVnLl0RMnvSSFlsyKdwCQk2U=;
        b=DOqoK31aVTkcdjwgGXRgS+YJYrvoNMVrBARh3Z5s25GVAdpttx2XRYO4Vj00DtVN+r
         Jg+DYqIZqgEfKWs1OPyxWNFbm1Z8h5Bfj8BS7h/uHQeGSlrLFY168P14Eo23iTLgrQLV
         w+Q25cjL+oite2GvpbbI7Of5RdAn9CCNURFKeo6zaOpxDwD2Y4u0RiVa+JWG3fhYfx9b
         Cmz/7Gg8BPitPj+8DeWqzQTYOtg6A4Y7GKAFthpetS7TUmA5mGL1i7lHkvQ0wX5YsE0Y
         qcUnC/UO4mIWxaco0pYuX7ft1mvEHQda4VCln9wU2mc0pyue3HrwLuJacBMZrOX7k3NA
         rM8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783526369; x=1784131169; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        b=edDNtOretPGQRs68M7QNBaqBnqanX8yzFJCFuDZJ7k7tPhPF2fcAJIUz1mBI0wuU7f
         AoPSGCp9JLsrvisT/2FnCkBaBU66E9s09CsuyosUBUM8v443+dySe7+nn9KovGQ5Ml8c
         Z6WZoxdsnex5TR/qVUfpKRxnO6gfDXgCmDMJ5BAgl/u/gplQyqGaAubf6h3g19+vLQk3
         67ShlWsHKDsly7HX1Pkt6h1vWQpv4g0GUmIbHK3HOPXppKCdxo7kQQhHtqVKuYdXX15p
         L6f3HYK2aA/uaHJ2Y/d2nR+18BXvxh1K4prgJWnBbMWeS6zMvPp3DcqmVHFgBNwoWhpu
         u1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526369; x=1784131169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        b=lRvC7u/H7RanS+Tj85efktctPRDRjwvtFjitWwO5WB3iznvvtFpjempHGSlEgrKWLZ
         SHDZTMoTxAN04UmvBIJuWr4R3ZJuwoyhAsdqyVjv4xhklpvcAwQwSW2uFZZueUSDQiuy
         /EHSqtdfGs/ZWnNg3YonTVIpFyhHkRF49Xs62Uttr98HVta9WUzW3jB9evWaTTGMTJpK
         x9DYH/3cqIBN7aqIlFC+r8L1GpZ+eQKdjcnoXIk5GqZnnXo9ofhcX27umE7arOuMIZGD
         6U6Qj4mcY9NGatSKi+CIa4CveKukzBBY6HA0K5j0NIaGu4Uae52GI9PZW8cA3mX3YfgB
         TTRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcT42SWF6ap/PQfAxE2GiHKQogs0RL8+yAKjMMFPfZnWCGpSzpSkMdVtaw7+pDB6lRF4hz/XeU2Y2rCy1ytLgt@lists.infradead.org
X-Gm-Message-State: AOJu0YwlmEptc+GRVEI2TtRqKzTpSc56Fq7Pruc91uxRCZbR0Rdol4QL
	PQbTP/5ZYbuL3wm2au2rpZPrUO3FbJsgHABr3T843sp+7jvKobKmoKvREOI3rkUNM2fGzkIbwWW
	SujNClfUBJjwphiPyFI5B5MDWIsYWHZTcZBjkvrYJ6/SWKceBhvpjLcZQg9nn5Vb254swar5ABI
	GS2ZD/v7crlLRW/pw4TNdRr26iPoNY/aS7HWfvyeqyNe2J8UYiRKcZ
X-Gm-Gg: AfdE7ckbImdyXpcBqm7d1cMFrkTSlM38FPbNqCWixheTcLiqVUudpbVzCMgChhpCEHu
	lhoS335U2EikSKRRunqhI3sgnI+QcvLH3MJ1sRASyNa2M0tm0IjkQ9sahvmXM29oH7ytdvrIzgL
	gqBGTFUdHq/+kd5SEI71OmRpNTv/AYdl3zmZZPbgJ81aawtWDf1gOOpJeIvj5Cj1FjUCNn
X-Received: by 2002:a05:6214:20eb:b0:8f6:9379:ecb with SMTP id 6a1803df08f44-8fd3b9b13b5mr81854986d6.26.1783526368971;
        Wed, 08 Jul 2026 08:59:28 -0700 (PDT)
X-Received: by 2002:a05:6214:20eb:b0:8f6:9379:ecb with SMTP id
 6a1803df08f44-8fd3b9b13b5mr81854656d6.26.1783526368570; Wed, 08 Jul 2026
 08:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
In-Reply-To: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:59:17 +0200
X-Gm-Features: AVVi8CeC7wqwD-02BFpq0hOApFiP2f8o6VkvQcjct29H4Ae_roSruiCfTUPVGNA
Message-ID: <CAPx+jO-BkzRPcuxkC4rCwGvXg8io_yD0Cx7zrwC6Sw6t5ff3SQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: imx93: Fix shared MIPI PHY resource management
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX9as7DPmLA1Rc
 GjJYucXYiSMiiQKtwYPBa7LM2wLuxkqLFZXH/oYCUDReKMklJhPEqGgWW4tok74xaHB3kSWidwK
 DASSIrXPj7GslsZjDrZiQvB0nXETM3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX3SIOmsYAdYdr
 fZcAPYVbEWH5kFh4dYZjyUQD1Orqp6+rUjsY+C/4punrQ1GOBQGBcfJlOL90ihwbvfMpJWQr1zQ
 35tUbP8dVEjyewZvCOcIdS8aah5im0diQIgzeJxpDP+TFTSsBYRKbyJdXlMk8DJLRdoebu5brNy
 aLyymfydOFk0/ph3gZYNBY5UX18VPMh/+iKYBl23VY4gWWKc4669pn4FdMF6M51K9+HNCzXUMix
 lG6HgApNRwsG7khbPMBNlGAMx0pt0HHIq1HRmtkEf3o+sIc3X0aaAldXL2f0Byqg/bYEE303Fyl
 c1oY281v3p2exyzBHCktvZvzCTt5xtg8sCoyDatltMhe2KMtw/w+RrXfIhzvffKmoKMem09M9Pd
 gzwRmXK3F/OS7SdKhwW+gN9xu5fBwm2yFYB9I3hZQ9g02FYNikwG+h9gSR7UIZsCj1V4bktE1NO
 9byxGXq/TZFewZu8BZA==
X-Proofpoint-ORIG-GUID: Bt8ac5tFgfkZBdWREZXyEeLWsKdcxvSh
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e73e1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8 a=v9JiyUteCMCEH8Pa4FgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: Bt8ac5tFgfkZBdWREZXyEeLWsKdcxvSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_085930_774311_6F45F844 
X-CRM114-Status: GOOD (  19.16  )
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

On Tue, Jun 9, 2026 at 8:24=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.com=
> wrote:
>
> The i.MX93 MIPI DSI and CSI domains share control bits for clock and
> reset in the media block controller. This creates a resource conflict
> where one domain can inadvertently disable shared resources while the
> other domain is still active, leading to system instability.
>
> This series fixes the issue by introducing a dedicated MIPI PHY power
> domain that owns the shared clock and reset control bits. The DSI and
> CSI domains are then made subdomains of this PHY domain, ensuring proper
> reference counting and preventing premature resource shutdown.
>
> Tested on i.MX93 EVK with concurrent DSI and CSI operations.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Both patches applied for fixes and by adding fixes/stable tag to
patch1 as well, thanks!

Kind regards
Uffe


> ---
> Guoniu Zhou (2):
>       dt-bindings: power: imx93: Add MIPI PHY power domain
>       pmdomain: imx93-blk-ctrl: Extract PHY as shared domain for DSI/CSI
>
>  drivers/pmdomain/imx/imx93-blk-ctrl.c       | 60 +++++++++++++++++++++++=
+++++-
>  include/dt-bindings/power/fsl,imx93-power.h |  1 +
>  2 files changed, 59 insertions(+), 2 deletions(-)
> ---
> base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
> change-id: 20260608-pm_imx93-6ccc1aa11932
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>

