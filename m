Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDABECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=; b=u1N1uTksRYCo+TwB7CPI9nMpf9
	fYROt9IBw7r/Ry+3+c4oziWxoj3Y6IfwME1Kb9uBkqyjeKUHuLlqjcn8hqznJchFs7xrid07GUIKJ
	+9zAIkV1U39rg/SjN+nZ6PKpMnkaOx2dTTEh6YhshG8PAbn+aXnRUiMkFE6P/U10S/tRU3q0Ds5Cg
	mKgB37IybADxiwN9kLVR5c0036a5551lCM9+BBKTjUL7a6zAMokkDIn/Gz1+QftIuwsa4cr+Mzw2d
	DW1j/ULqdIUtASasFnfLKXgDilwJGoZozZYtlZi4jbk0OIgXqnAzc8EmyuJam0oYAuuU/6R72onGz
	IVbEzlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3cM-0000000BHIr-2mYk;
	Mon, 01 Jun 2026 14:27:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3cJ-0000000BHHZ-1KtQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:27:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BB5de3127896
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Jun 2026 14:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=; b=eYSeQywf7FMxqrQk
	od7fVL+a15CjGgOjdKZ9JrJ6YgjM8H3b2KIHu1wZdwESi2mpqdqdk0gEILmxUiHd
	z7cILavNamfurl9wlRFX4dJL7LgBTviAm3kNOZa8ZsZNKq6RmiTRn466q+SngTqF
	MKkap1nUOcXGSGemv+DzXT+Bet7+QpfuoovnXJmrziUq3MPPtbOP587h5B7hJ09g
	w2R4AMcxbr/duIUgGGpmFUBxyAM+pcfI5jDVqBE584F72S/9lAbrV0FpLLF7+8Ix
	W6m3+2XO84Cydmp6MgZg4CdmVCBeXCk20G87YdSUah+HAZSPz3t5QClstxpP5fzO
	O/GUJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9010sug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:27:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd3213beaso78084096d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780324065; cv=none;
        d=google.com; s=arc-20240605;
        b=DTIm80es7o+gJeL9aYOo8LRhUXvwlPLty/NZXknjOVEA5NXasf6aqyJ2ctAcmgaYd8
         JrYI/FlfFx6454gu5K/UsjrS3bIfbnZujwFvpTnEi3Hhrm25qxQXuEowH+vago6cEtAX
         dhgzbQElAJ3HUELH4noIcgl/aENqpGYWzlcUu2hDieFCWSHy2Okbiq4sQ9qVB2/Dm41c
         LcYWC+Mw8hdugvs9S2ftYpggiiacHVtMlKojYnOnnjJ5S26rglEyfT9l0sJxOZUABqGl
         Bx0Od8OVWl+lqqisIanXqFD7ZB3G5bby1q5P5ONR6dHwhFX+mMI2NWPZr3JTu/+j2Z44
         cdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        fh=c7yRhAMP/CwTF8UXsM+GMftTHxHyK4otDyuY6YWT+XU=;
        b=bE8sz4Glf0T6sHZKrq96yig+WYWqFi6DpHSU1FXqyIZlfpwHc0ekLEuPxgRPUP2UBg
         D8DLixhf0lV92nU1hNWJSTAUGJpLuVDKrRggBzxeaNPGzEjecpJGTFNValZ3P1wpbgLN
         DW5jlYelJVW6dztNynCmQ1NrWcxvHGzqCXp259VXwSwOYx8Peauub0Yz5QJP8EtjNvPK
         JsDDJhD1wrg5QjqGLHws/5nZqO5cFAgABvV719isslI7meSzsB8TAuM/dB7+U4PKoTav
         mxWSaGQSqhfC+t1t313utIyrlSXWk+rc2qc/j4AlB4VWu4d5uftb/51vRtrUTRVacGbd
         q+qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780324065; x=1780928865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=CNKAQWSBDKl9qJR7ocC+5Ma0Og3ea/oJAbbKPTbT8HUPIF12ma2H9H+Rhgc+6/giCS
         czmRIllmy6JosypruMR3B/Qe0SVoP5ubshVhaDZ+8399TCBkOytoJIMqLT7Yh0e7U38A
         zs9qc6dDOz/tUj0JXtlFgQP/jCM3yc1P0u0RY2u8cdBspLvFMG92Goz3pQ5p8wYyXs+V
         qcTuF/8tF8nyHMUue6WuWLTq7L6lQLiMHNhpFjZHps2tR/tNSrk+MCuDUkRbbIoFnOpM
         FSYwFLRBD9PQYCvMjTvQ7UvIcZDCiTT9TLhKa4sGGx6Bz5QJzE0lGNsvY7EsGoSeMYkO
         RVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324065; x=1780928865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=EVKwomlvxGJwmCOvMxWyzdb3pYDRYHXwsc32C0TVIlazu0miuaWpAkw7ZLTTaYoVP9
         I0OKfXagNnaGYGk0mufYyWSrGXx3i6FgV8jnZs5A/GOv0Jv5NSc0VqTp5JCnL+9019LD
         +KtStCcAGINNCwckq+YXpAP9XAKSCiIZpzr1ASHFP4JTNuvY1rd+WystwvcuikTYYmCn
         lnjAmQI/ZYvaHORN+LJt/feeurbfyoC6tobCCAMl/NNDSuRQA+bTYmYSn7n2EEYwv3UP
         5izEsaXViCwdx4Isnrba9fV5JL3SHbGBHjYxojrFVbJDvPnSiFpFKNT4qQONlLrDQgHS
         qEPA==
X-Forwarded-Encrypted: i=1; AFNElJ/tOFbOinmkHrpsG1NygrUutmXvOeGcYwg75+IIfI2zE22rR7KD305Ntaqr1mKUZKYwUmGkO3r1GUGQcUCBaFXz@lists.infradead.org
X-Gm-Message-State: AOJu0YwFVcXnAbUHMKTxTYfcj2w9rcyO5xhbknkXJ6sW/hd5KSCxcaRl
	3Z/fi/nTFXpvmlfjW0QCWgbBNpkNdn5GrpbAJglyUHuucUR1OFIJtKdCCx1/IznXnTQxeTPTGLV
	GdxBLhcKIGD36Gl1w+mPwBknibSJGAHl0tVRVlYTAoYoN68pGLf2EEhwHLsvEcf5H9ocbIxrEhA
	bFeMY1MXQFY+vtRFXiu6sbVaTDsu//uw4TvisluM1Wu8wFWV1OF8afZPBtXOpvXMuyFw==
X-Gm-Gg: Acq92OGnCfIlhjHjJz/tiZEeBSPdUNZ6JQR+GCfokRauWnOi99Qb+59dBwfHV6/x7vP
	rpCkAOS8EX9/uypYgOHBFNvxgzP/QjatzR7+bTT+cbfYeAS8hCefeFKMyS3C4wwYf02GqZ6oxmG
	soyEK/bh7xTOZodDcxV3wWQ0fa9jrqTO1XLdBGOYLzX1TVDCCXuzNFLdGno70fkDnA6IdTwnOXb
	DPYEEGJvf3n50hbtAuHq2OPNuW1VnWh4o6/TFSWTyjLxg==
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id af79cd13be357-9153d938aa6mr1215100685a.8.1780324065160;
        Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id
 af79cd13be357-9153d938aa6mr1215093485a.8.1780324064677; Mon, 01 Jun 2026
 07:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4> <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org> <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
In-Reply-To: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:27:31 +0200
X-Gm-Features: AVHnY4LtL5VPWicujYWGAL868BWzmKvPSaREWLjiMCcMMmubijXxiTOJv64_r_I
Message-ID: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d96e1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=6RP30FUjIQ2jcUxmk7IA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VqYzdF6LQSIgyjt98jw1dtbfVFxavaCQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0NCBTYWx0ZWRfX2n9x5klIeNrg
 cG8E0RrGZCwPQbJgXzKFoIr2jFbyk+rOCUlR7wStC9ZYN89sZCl73cZxxAmiX2OgIZ3hVzCrU9C
 9362siYAr8KUxawMsM83ZRg7Cv/BINlwNViiHI/2zK62lvyCz1YzMWhmz8a7Nh/c5SyXGItj4Q7
 bygOSve0w11FYApDYGS6GzWdHcKXSRlPbRhbQ7Kx/4X8tV75Nn/coOW8eqhrBirqQdvaY8kWelX
 BMgqzu9AwiApk/r5c+zruGWe+fs5kE1ldYd4jPw7cDz039rJZsxcTHxo8dTXUcz2Npc1Gm3shjn
 kONbI+OOCCQGlLH0RghJx4ckNAGVZVDaQEbJYeLe6pVMQO/JK9r/MQyMDQcaIA8FIvxZdQNHSrr
 Zvg5Sbv+Wew7y3SRfH3w5kXT4LLvOyZRnYNE35rp+l8iDZWs8w2D1Pb56xI5eY1P13SKsyZX29z
 0y2kVnhQc/j+Ywa26yA==
X-Proofpoint-GUID: VqYzdF6LQSIgyjt98jw1dtbfVFxavaCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_072747_493246_7059F9CF 
X-CRM114-Status: GOOD (  25.43  )
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

On Mon, Jun 1, 2026 at 4:15=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> > Here is the full IOMMU SID list for both platforms:
> > Agatti (QCM2290):
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0800 0x00 =E2=80=94 CDM non-protected
> > - 0x0820 0x00 =E2=80=94 OPE read non-protected
> > - 0x0840 0x00 =E2=80=94 OPE write non-protected
> >
> > Shikra:
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0600 0x00 =E2=80=94 CDM non-protected
> > - 0x0620 0x00 =E2=80=94 OPE read non-protected
> > - 0x0640 0x00 =E2=80=94 OPE write non-protected
>
> What this tells me is that the Agatti binding is incorrect for addition
> of OPE as a separate device.
>
> > Only VFE SID (0x0400) is shared between the two platforms.
>
> Both platforms have the same IOMMU list, its just that you are
> correcting a bug in Agatti's defintion.

Yes, Agatti is declaring too much if we want to go the camss multi-node way=
.

>
> Again only IFE SIDs should be included in CAMSS...
>
> > The current Shikra submission enumerates only the VFE SID.
>
> Great, this is what we want.
>
> I think for future submissions we need to be commenting, naming,
> something each IOMMU entry as we have a problem now in Agatti and a
> legacy problem - already - in VIDC as a result of misallocated IOMMU
> entries.
> > Should CDM and OPE each get a separate YAML binding like [1], or
> > should both be part of the CAMSS YAML binding? If part of CAMSS,
> > please confirm and we will add their SIDs in the DTS in the next revisi=
on.
> > [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-
> > bb1055274603@oss.qualcomm.com/
>
> Yes I think CDM should be a standalone block and BTW use standard DMA
> APIs with its own IOMMU entry.

Interesting, so CDM should be a dedicated subnode as well, and not
part of the OPE?
Then, If we want to use it from OPE at some point we would need some
'cdm' phandle in OPE node.

Regards,
Loic

