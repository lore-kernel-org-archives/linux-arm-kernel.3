Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB7AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=; b=flPnNeVNHh/dr+2VttRwPCHEWj
	l8XIgkGfdyNJsjq/VRfsZjanhs0mutLh1Qul9UQDvrYWjg1B8XB4NTI4m5auCpIpXRZ4ej4zSrPfQ
	X720/3+4BJ6hrb/eO2BY+wqszzX+RhJs+Iz4Z6vCQ7ctnau1ZH3lViT4NSE6Pq4MQqMfCMuUtJzwm
	6ZEQhbwiILSYv9z8oX2ZTlRI3FJg12fk+r51b+dN8Hngn5Ywh1Jk7qutgwHqXxKKA6DoVyQjBy3xM
	UIlTxsMbSx22DLJJGS9zVEFxOzs4GkAL2uGxJ3wYimCi7LHZstvHtURRdeR+2DqAsL7zqGk+4+hm8
	bGsNi3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuQV-0000000E4z2-2yPs;
	Wed, 15 Jul 2026 07:53:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuQR-0000000E4xd-216g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:53:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l6ZW2373375
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=; b=Sz+G2/VCYAbYlEVg
	GWsJHKNm/x1ElQWVGvbElyl795HC6WCN4WOhRCllGM8MOAU9YVPnUWr8nfjcAj6i
	AfSomJ/oRUOA3Mpk3ehnz7XD8cWUfB+0uWBqAwm3idNoqVq1AmKS1wwbYXZGoOFr
	r3KTmwK91J9i6vmnou7C9BY4g2JzkWu0XEGw7BC13GwG8SLrMptnde32Ho1XXUGg
	XA+F/DEH3kkYbV9gzNSVNTxYbS8tG+fOBnscHcvIuEqpcfffLy2HYYhbUoiu8Vuq
	Vd7b2v6BncOCq6mdqgj3DU4gg6I21hUDnOF95n2wcQAb4eMkyvFISLWK1xBypWod
	pKDHNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3xp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:53:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ea24a2db9so792975285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784101981; cv=none;
        d=google.com; s=arc-20260327;
        b=Shcr9ufxNwCGpI9Og3N6ZMl8uGIRqx61HT91DYIxmPOiKAPrsLcvUXsV1p1eTrHcST
         kdZXnvDcU7cVA7THExqeJczeWaehIg02mS1NCCdbyBYkRfej2BJKUE5h/23ixhqUtsZg
         T2+EYkwrIUNKEhSB6jEzPCPAOVLoaVK/4kTJU1D/T8D6rJIIBeL4ANVSNkLXt+oDnfOI
         RHLeLboUTCkEXiTTd0oVxknuNUG1e7sJpisB+mDsayWPkh/lZsB8eoiijHQXaK912Zbz
         OPyr5O6O0lZO2PaQ2NL/EHl0l+pNBvOaSNNjiQ/+Pd3WTih7Y9EXSd8C/satErez2+3Y
         3DfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        fh=K7mZtxRlEjTHModjlIrSDGh710B02HzfbHEFi8wDEkA=;
        b=nL34nSB9cq5jDOp5nxVEIgxcQrYcIrRWmK33WPb9TlP89lysOYfAPee07vBDCiakGv
         PV+8qnBpXM5NreYbmLzG0g7J+qGUtxEGBviAfalfdPmuFlGAcnubQos6ismYGbWj/ilg
         VYJ35PNBQzPNO6EAs1PXK3/HAaJJi0u8xLFW2eC0o2DTTsxYVvqrDnxmagqMtKiOBkEb
         sgA4YZVxlHDAxgsXAEo2ubAlODI0Hv8TW9IOwblX5hxReOoo7AV/GRuAhgvu+BirwvhK
         krd8fqLjgrB0i8RqX94IGKZshsi22k2yFROst1GiBwjd0iIBoiYRWy64anLkGSkZ+e2/
         vTAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101981; x=1784706781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=D+7QAjQBDFzDDhUawkSCXoimapDErouCDyrk1MQhozQU/KHZKsLzrxFAOTpcbxr/8I
         vvjKkVbuqhNdxLci5rBV5UcqArjcFR+ECVuGpPjPqZjnYaMaq11G8hVhizjKfUXxOrHF
         7LQZcn9uSyoBFJ4mMNitumpUng6NUyzFNzOOQMGYVCnHvcaFCT0O5yGJFUpSUTp8nweo
         QP2e7UN2tRcejyHLlqfwzWpb7P/m2NdK2LCBqfmyZRAuEU0m3MU91XQmhqhOLqfVuTKV
         kahjcqU78kmadoMEhW6UMdR48BV3l3KTzaG2T0mISbpYv4nJqwRuxeesnlOE5A+TP2t7
         GbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101981; x=1784706781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=nAxXE8FqkyIaud1KvlPspu1PI0gnDmqDXawu0liO508F4IeqPM95cdriVb9z+ZQGPT
         lozohzBcPln+sXX4VO2mHebogAQIqDCCQKzoYMS4/XYd07y4Pms/K42friB/XNQ2T1QN
         IkmquMvO3sVj6vmZxYxdO9sslwOvBAOk6SwqW8TBeB+k5a2WVaO/5MyZqtL5IRB22Z7L
         hxqmTXkWQRCQ2oHf5wNXf1x4kV2bZjVH/CGgJHX3Zo3oLrrOvwTN9gdFXIX30ehbWM/4
         ORewzZbBB3cjkLSRSweZQJ4SOSiQVz9EAotSaIVaWUcjsHkEhGGgGVIsybJyPuwVZpS9
         WpiA==
X-Forwarded-Encrypted: i=1; AHgh+RqBR3wy1h8w9D11X9+3WI62/CQaNtB7cqdXTVAuZ7ZXoYjVaY8JrjZrEURbpnfi4IRq2s7CCxcJWY8XVUvSdPyX@lists.infradead.org
X-Gm-Message-State: AOJu0YzAdjrN+TyOaegOBMLwCTxF4YDOW2nQb7PmiQYDGQdCi6hHud+y
	2gQYbzkBxba/wnRapJaikkdQ8vw7b33ar36kG6oCEy3r+BOlA0PzP8LhNTMyGGIassZjYMVH40q
	e9uw4FmsmWn/uWTSOaiCqXltYBXjpmfi1/SrQA0paC5vYs2by3ZbTVwy/Su+2hgw4XWdK2jui6g
	JtPzK8j9eEmsXJBCyNWLa88nHdhKNZRirCutV1p8VEslhfP2siUkZi
X-Gm-Gg: AfdE7clnYx+cVHmiZACVX3tZZTgkB57vIANn3xZUNkzgrwhLXG963LLgSw9JSlrSfCa
	VDQJjGYX5lTDElgbCFTXTNHJTTH54XjP7YjZn5uJXkHdW1NaKAHBEetCnV6LlLXV+Xq5OzYTIE6
	d3tXHFBtE8/pwOndQ3lhl5X6It5IQ6LaDi8EVD9J7X+LhjtEJukrpc5VBhbroX4YVDmB+39LxG2
	lKQtt3yPqRcvJOFoCf4h+ufLBSADzl16SLcnW4a1aFgERNe6DbQUCz1vQLRvTcwsGmURg/QJrkK
	9qC4XsA+Xms=
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id af79cd13be357-93086bea55cmr545860285a.56.1784101980999;
        Wed, 15 Jul 2026 00:53:00 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id
 af79cd13be357-93086bea55cmr545858585a.56.1784101980599; Wed, 15 Jul 2026
 00:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com> <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:52:48 +0200
X-Gm-Features: AUfX_mylGXRGoAJ8WLPXjHG-LrYjgeK28hgV3O_EXafPt2RbMf7pLiI-38KOrs0
Message-ID: <CAFEp6-3MrGLyTQ5+qaZ2nF=EWLgOhepTB41CwEEQZwJ6zQh8Rw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7z2QRxZstfhDfwcN5Xwg-VRL9vc0equz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfX2xIf+qKoRa3+
 28nPDt/sWaoHJjjekgtBp5ZTEOix75YBk7J4CoQnjVsEnPd01awgFHPAYoYItQiUv4eFTiPTNNP
 1UdgZ/TKgH/23HE09rajS8npo4ZuA3lWLGBZ7zmuXOJG6PVYYxc5ZvACVs99d1pUiQ5fPGRi/eG
 dYKpStWoprs2E2eM/2KAlxdyYTJtbtOgzy1K6HCpykz72w9/syvkn/XEGVJ9t3eyfoMmnXakLa1
 TcbGaGoPLGH4oPZfiS3pIf8z6XMV2aIhdaCvHFBSywWqzAYXY/HkPnmE2rWiHYtL562uROy6oSt
 KCGxjMWDvS6gq8TSdLR/zoCy4QpuUwKtq+wa0qqqjVZhNMhaVxlFFyxy21g+xgoNe/nC0UoXg8Z
 t24ZfI61hwZ72RvaOTHH4bn7+XAIXLP+GBVVUyfOOtrA1lfM5emnBttN+LExCiA24sK2MvLrOuj
 nplAGzY16FZstdiexMQ==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a573c5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=U2PIo7JDszhCzVx53KgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7z2QRxZstfhDfwcN5Xwg-VRL9vc0equz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfXzuN0YQP/1Mj1
 jSIJQJlB04r1YX21GxWYFqUZANOwcsYLlVc0GjiQVUxPQ4Af7Lnn1GUT/HbkjllKoCF3FoarLUb
 v/GOfcb0bQDV6HJXIvzgEywTvBfDAEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_005303_524536_F8053125 
X-CRM114-Status: GOOD (  17.01  )
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

On Mon, Jul 13, 2026 at 11:29=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eac=
eac796e342efd16 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
>                                 bias-disable;
>                         };
>
> +                       cci_i2c0_default: cci-i2c0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c0_sleep: cci-i2c0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci_i2c1_default: cci-i2c1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c1_sleep: cci-i2c1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
>                         sdc1_state_on: sdc1-on-state {
>                                 clk-pins {
>                                         pins =3D "sdc1_clk";
> @@ -702,6 +734,44 @@ port@1 {
>                                         reg =3D <1>;
>                                 };
>                         };
> +
> +               };
> +
> +               cci: cci@5c1b000 {
> +                       compatible =3D "qcom,shikra-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0x0 0x05c1b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 206 IRQ_TYPE_EDGE_RISING =
0>;
> +
> +                       clocks =3D <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                                <&gcc GCC_CAMSS_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci_i2c0_default &cci_i2c1_defaul=
t>;
> +                       pinctrl-1 =3D <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
>                 };
>
>                 qupv3_0: geniqup@4ac0000 {
>
> --
> 2.34.1
>

