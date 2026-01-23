Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC90D3EE9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=; b=1++U0MesWp9pObbcatUtuEQqZo
	xOR5d5ISDcJWtsKA8QG3Qpr3XNoG73cixi8Snq/PUXxMWNB4CbZX9CujxmKEcOCZryFLjFGXnfTBi
	6Ej1bQw+EeGyKUQnZZ2tT6CS82KYuXAtLtjINhDbm2CwXS6J+VCVuyFRjeKHcxG7AB3b76+bG2G1/
	6AB4/n4j+8J7Flnkg1w3v5dg4Pls111ugdi+fZllirKGwAxLzKDCrflAeNey/DgiQ8ROyNcCx+haj
	CqkyyVVkBikWczi1gPKlxavsQvdj011kBmmfX63ISc2QtLzGg4GMdgfz5ZMd1JMuUeLfkvFW82NzC
	P1WxZnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjB3P-00000008KNe-0Wm4;
	Fri, 23 Jan 2026 06:53:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjB3M-00000008KMc-3gGO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:53:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N69laJ2910302
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 06:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=; b=b2/i92SUYiaESdwo
	VjpgHSfUiI9ApnLF4g+bN9LAW7zupMgnhCP4F9o8tLoJO7gv+VIdRuAgKrfweDLy
	YiZLR7ffNcNbVFBysSa3ZrZ0kOuzbK4SK/MykF6F/4rmfOTJy/xFloC7XR/3Cm7a
	00MPHEI8J1dbYMJ/4d2KB+bpBTZ6ZWt5ay5qh5w2ArRGpwyGy5wTEDUuU88a9ISf
	RJZcc39lq2fkNIq04SmCjD7HPi4JCp8INMfsq8smh0uOtBljMhR81ImMqt7kjgJH
	onVApRORNsJUohMQArtR0lksWoi4QJHICWbMkiMzJi91TVVjajjnQ/R5efOFfgxb
	Ijc6AQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1sg8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 06:53:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so21916886d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 22:53:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769151234; cv=none;
        d=google.com; s=arc-20240605;
        b=TvHVZz3oyJifSRdbZW1AGsnaNeOiRw3n3uC6in/yK7Hl6EXdm94f9zEwH+F0jWMQ/M
         qsstyhkSySQR03wJXnTIRfC8l/IuDd2kNxw67uJ1Z+u3TnH6ZUXvy2TaCPUPLDOWb5EA
         /2DyUKzPJRQNdOov2Z+FuFEl8hNWUYX19tEailRkkckHMoWUK1EBj8HOJGAWzTIxtbeD
         bBmLIVgOrgU6voG/hRXhtPdHtg/uwX74wJ2lvMIx4S5ywxLZikp1pq4LcOX2N1qNdvZH
         xbMkvDgSA5ULQs6+1GU69EI1AjNN9a5tddPW2UhNg9H+Uhtf0wlpjcHrlPZe/B9B7eEj
         3Cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        fh=d4bdOll1OWsmC1B0mfcczxKM2C8mGAzSEQWTAA5zL3E=;
        b=ONTAly/80x9LZb7G/ed7j1Upg5UPsrW9OtPBTFPcm2pcd2Cd8VzNkHBZLh+2uOGJBi
         M+WiwPKxDshI+gP3VHVZTLEO4Yq1/I0kOKtFLEtjoQEl3xHMPp3CIZATWKXMbwADVdda
         kY38KRw+aqV+hfMOLk3XgoTX/qf7YTeWEOD8p9PWh9EVyUAFBhpTd0pQxizCgpP6Rsk1
         5cdlgrTIgJFd8VTmSpv2sCCjUgqweC9HywlQyhlGMhNgFcAXX9qdiby2dTeO5bh8VCU2
         bnk5hiQNikivrFtZr5N2xqSkEwwTVkYnTWHWb8+FoAsnf/bfPiin/OkEA93eSG3n6lR7
         rPvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769151234; x=1769756034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=eQsQbyRuPzSdaVIjCc4roXu4IdDZt6IYCWXtrQVxFSER4QMrgdFlxHglg6NVYG5ck0
         K0U0824jGV2b+/yGv2srtpg5ZUSsITZHe07rSNwT3KnHhUI49KlbZ4mSg5gLWAA4bZbU
         Hle1JRrtQRc+mNJ+H/06OC05fXglohH3i9ENfQzyvYTao24oO5Jpd/8oTkb5pOVGWxq8
         GhQOSdGRq9WhifWtLa942GW6u3drlrTXOdMaMg/bOs/D93Dd4cuxZbDayqbZwr6g9PGW
         wzzc4CjAfNtW06GdhR/NZOBPmGAcIorTWP3jYmAna4XHgpPfuwVCfex69pyH+QK15qre
         30bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769151234; x=1769756034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=HH3XHOq2JCtMZ6Ru35okYK2O6zbEwpmN4b3gtgXQRr/jVolKwHLg/bTBvOn260oVo0
         PChVAaz4bO/iERy4zbg0aO2e4y0UiAa+5rD2EG3X/6QyBF0ytC72dJipS/QqX8AfOMqj
         fz5hWqe8vhZotX0LvXrYMt/yy+8sssPG4WpBicrklDNt71XYvfHgwp+iTkBk+PLew+jx
         w3SnGD/Fgqk6Lt7cYrW/9DrxqiBEVxubuTdfzqoPPoCoHN6+x3NC9sBNvT7hkl96IZvJ
         PIbXdzCWyCD3ndkzQFzaXsog1mUubz+3YRixYOpusk59NMPkEso4kmRFCtFstnfjx/gc
         NAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAtC2edM/EwmCzEY9hEmYZ/GQ0afoV33D2X/ctb2nFkfCPRfHBptVlvR0cjXE3tvc5mMh3egk5mOxUIt2mpvc/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywla+Ge/J5307BteZ1fGmvJO01oq9G5u7rx/cOsu7GE/HXjpo8d
	9A6S/7JgA92q2Uu2mkVPtIiQZ6hB5pI/EQnEofjXzwxlpagWQye0HnsAryru2LpIWglX/8Xs+dG
	3Wh47KsE6tZUZwJ7suZEfvGP2C5oxrq/QvfitEwBaFrpkkZIN18aE3WoJeYXX9+/WRfFIpMgrDP
	KFYA2pJ/BNnowhkTNewnc+dBPf4P4wk1jpcknV5+80/qHRSk0G4PYG
X-Gm-Gg: AZuq6aJpx2qgsk7WqwDSLquqiG4gCKNEV2FXoK2V2OnkI8Pym8TjHcF3k8HUR/dpE3K
	ZutqA/KnCHJVmBzzhlUInJTqgYG3mBBfvozA1uDa3PsfTak4vPDD/5v4TFuI5NBDIVUu6epvvNx
	DBwg+jCVoFoP1YKjjylrmVFYMJfkTLjP1eHWjSwyeVzQ3zsfoPfGw982hTXdpNxovtGRZ459eR1
	e8UILUdA40fXh3zZrvIC+aW
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id 6a1803df08f44-8949020d656mr29225136d6.38.1769151233713;
        Thu, 22 Jan 2026 22:53:53 -0800 (PST)
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id
 6a1803df08f44-8949020d656mr29224416d6.38.1769151232692; Thu, 22 Jan 2026
 22:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com> <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 07:53:41 +0100
X-Gm-Features: AZwV_QgW9xaHk1V60VCFg-RSltJOSQPj7qJ8VK_VnWofnB4yGozL2VT2va8zIr4
Message-ID: <CAFEp6-3qrfnn5EdLXX1+1qGtAZa=L4QS1nyCs23JnKq+oy=pqg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: W480Q7U7UWq8hTbNN7FjYVO79V1YgKO2
X-Proofpoint-ORIG-GUID: W480Q7U7UWq8hTbNN7FjYVO79V1YgKO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MSBTYWx0ZWRfX2aaBWxpfMs9r
 u58gUM7SP1agNMpA6yD1Qo0bz/NFWcAzjj4omY/jnt/PHa3AljOOfx5jEgppbnjW+WpQ+VTwecr
 u2tY+iwEEQHSOsr8QsZG2njQuX8DUvXF9UfMQdQZD03HkPNKlrtv+IvdItxXPkhXVD04XRwbSqX
 afWpxi2m1dOPJ931hjXvaSQZTKhvpQOUvRhSt29IWs0F/SvH/yxT/TwIO4fyyKwFQtoHBZOMHUe
 QThsoWoJshRv0DTf4oMyHjluaDJNtfIYJlEcJb/8RfTHLYRn7PYIt/njyI897NPykroHzWb9ppx
 Q59hkG48IC6prKOUmwCbEWGVeL8PVPGKAiNjuU1Jab2bH2OSwHGunOh6fkgeCFuCNgyR93uY17c
 pJL6glQgiybeDDKz7UZe5QuJTXoFUOJIHHkVki5mzHhANe99zMRshGjl+aS4EcQP2jGCe+nArHb
 R8Zp3Vi+Qd4samxPaLA==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=69731b03 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=AGkvFC_LJttw-4NvuOEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_225357_028536_D4E8C9B5 
X-CRM114-Status: GOOD (  15.70  )
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

On Thu, Jan 22, 2026 at 11:41=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
> Add the sm6150 CCI device string compatible.
>
> SM6150 include three clock:
> bus: Bus clock responsible for data transfer.
> iface: Interface clock responsible for register read and write.
> cci: Clock for CCI core operations.
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c9=
4551583d8deaabc 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
> @@ -249,6 +250,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,sa8775p-cci
> +              - qcom,sm6150-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
>                - qcom,x1e80100-cci
>
> --
> 2.34.1
>

