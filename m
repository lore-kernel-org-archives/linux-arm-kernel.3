Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466C9CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=; b=mx6+HVlkkUOEsVxAXL34g9h5/T
	JDiH5MG4aeCJO/JVo2eu65cQ12mYjBvlPq+GQw6BUquha/OldOVMVKKoan8DXBbuZ6JvVM26Ba0Qz
	9WAWYefbXer+u4nRxwxAkeoUokrWny/OMl/ONhcOWIntVGY1SaqF8xs8tBOpAwjvbGxGNjdCrDx8L
	OYpsQxWc9GUKGrrV3oqOg2kLEpOpo2LXWKwQ/jvYDhJnXqMGGjZ8yW9m2dkJvHF3uur+Uv5OuszpJ
	xvyHE+EgrcCASjBQQJ83l28OQz07jw0X6rzu5LP65i0iBRTTGZezu0JMsXF/jn/Yz5h4mHW78L+0i
	XNdnKg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbziP-00000006DVm-3afM;
	Tue, 23 Jun 2026 11:54:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbziM-00000006DSr-35eV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYgEs113419
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=; b=Vvc/uqFUHWTIaaHw
	CgykLxh+JHbckuAbxr8LVfoxnnIpUyBQj287laGknSqX7pOZSSLpGsPrSAYWRcS+
	k+H+i40QkYoQxdBykEvh5BrF6HyKN3Td1orFAy1o2bYjnSuwYjOwvcRofmktQE5k
	hMqVRmd0wJAgUGR1+zMxIcflbZlA5seD39z7St0Kbrike7NxXRQOmlwaK0X5nhTm
	yPe5OSX6oy6SXOyRLgdjXnZbsO/scPyawcLxVz2PGhOunTtpvEwhL1Bb0WBJqd73
	yNUIKOr3FoCTo2VwA5NNDjw4wW28XoaBUS9X7FrTqyhPI+MtMGKYDfZEQkulIne0
	+DOtnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsb5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:54:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91598ab3a1aso688300085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782215689; cv=none;
        d=google.com; s=arc-20240605;
        b=fhu0wHM/j1mcuP8SFDmL09Cmz9aB2rEzCQrviL2zMprYcgp7RCtdegWs2ozOv0K14S
         N5zkQHL4sFAPLHrEtGssGMWQzszhSnnj9SBSnne3JF8y05t1mbym8swX44wZPowZSOug
         iLqnerhtb3siMOK/fUx1VU+Igrm4IyVeqsXz6T3TuXgp+Dpa9ue2aajz7WSA8mfelTmd
         IhxM3sF9jgP/LZBcYaaMBlhs2JD1zr2zFGHIQyGQt/E7BMtDzAQcoc7HyuTSggmfuZuF
         TiJ9BUWSuRJcGmcztZDQGuOie98svgRiL+TwrmeTRqRQAYg208AN4/2J1f0kOcqRLofB
         2DLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        fh=8kaac2QTEOnNrMEHDevl4jBz/Z4brMJAi/KwBT4/wrE=;
        b=P+AwGxbbwHvFmszVxvNKlmf54g6EXP392zYL3JTn7Mm4DaLtlwgkwLNs0lGk06rL7a
         GjGPNuUL04k/ebVu2p/M4Y2+ExkR2SnZFEEqwaFF8iQaO0XvNQ2G1LNCfdZVZLPrg6i3
         lc2C4cyDjT0z5hz6/OKCLqvPoQPV6G/iNBosRhFFHYDkPEjyDa78LxHCB3b9Vg1bOHao
         tk9eByMKksV0wAxgUYRWC34PrN7dRUTZAw0sZ7YurPmF/jA0Pfxvxdy5rwUK5XvlTvEm
         6m3jyIkZPxiHPY3keiu7R1wPQmqgisv2w1XfmYwjjnV2TFzgBx/hEnfxp2O2fZFFWQDi
         LSMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215689; x=1782820489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=MCNhlkYfu+dY4CXkaemabV9Far2lbKxTFeg7qLrwHRvFMI/4g+Tub2Dn615bfoaMSU
         7tnInAOXaDsmAiIvIstTQFFWMNymAGV4SLpODtwsjbFajSVdRmiDt23cM7B7c1J3V2b2
         GftkSXYeZHbeHI17/+TR8jLsR4EcyRMDAJO8A6e4rLczpblPzODpNa1cOiY9EhQ9avJK
         9d5ZRUbtslAkXm6CP/3QXErG/S1I1LNULu4Fj75ox4eVvKPBqhMjpn2GRTC47Q1oYCFe
         EAxMBOiDj1k5QUIw81KIEmLl3kpoBHv0kC1Z0ZRMyR1s0P7mHqq3HbRK87mvJik7cJKT
         XVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215689; x=1782820489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=shoNtCHmyOpIlUtd0DAc4dHBRYvoPeGSNsOp8BjdDwrVFGIymrxHCg41CpOfiMZ62h
         Bd0DzsjfzY5nJJjqtaTatiL7RG+n5xdjY78r8K4rUlMN4QzmeeR2490gh3H5vawTsGAu
         QeMY66j0H+rn498CNImxf1CF+hQHrq6vDBp6rvBC+Zn1O3j5vpb7PzK6Mi/JnDXO20O8
         w1RGOtDPG2tsYMlN3r+R7ecMHFXsKptGMyIeyqyOCKSDWVKQ7JtzF50cN/NjsvbRZyGU
         QbNGgJ/3ADsI/hCGZ/GgZgNZMrOJM2DQfEOjrcWlDZnB13KUYNRAUzozycjdQ2hLxrsl
         TxXw==
X-Forwarded-Encrypted: i=1; AFNElJ+4YKcUk3HH7ZZtRxYoShvodWd84KacvJJ7goa0lnf/wguWYEWFHzKfexrlSQy1kXDiQmc6UJl2RslpwU55Wrbp@lists.infradead.org
X-Gm-Message-State: AOJu0YzpsjUNfEnhtDaCs6LvEkb6QxNx7x3DHS0aADgjtnoJwGw1Xv9F
	kWjWThH9oDqJgVE8KpUVhxZsUrt5myT2pN5iVtgTEfJrkJLCsU0sDa8uTHSY7PEEmTdZRniqh0q
	DdtVJaJdHMdLF6CW23+g42Uf4ybP0ymEN9W7ghK7i9sBuvXxM6oPwayIQ4I5N31ztExnKvSMbyI
	FcG3boQPc1sVlvlUPnWTXC//tEjEf0LFXDbtRNitof7ua2OG6eW5Ck
X-Gm-Gg: AfdE7ckUfryPbRSsN1xEFwr8SAGFSI2n+xdprZr1YNii1xsq3ipXjPxa1d+u4yPruv4
	XJpG1cZieOitCogRIiL9QFZKH7fX++lolt8veHQ+kgHkf+QY92IWwEcUNoplbtMCKn9opsX1gvK
	eE1eZMNIWdNlA6twlG7MaXA91qY8Vum7yJjKYyUqsTdTeUzyYIQuQIkv+m0u3HkDJW+2Vp4US+5
	glS1pGYKE44giz5jOznRCpO5hLRLDVLLniVMGd4c6g0LjuzfqupJKmiaPtlea2wMs+IlI6e2Grs
	M2/1fG52Tx0=
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id af79cd13be357-9264771b2a0mr434708085a.30.1782215689093;
        Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id
 af79cd13be357-9264771b2a0mr434702185a.30.1782215688526; Tue, 23 Jun 2026
 04:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com> <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:54:37 +0200
X-Gm-Features: AVVi8Cdel5T7fniqHB4_fyyFIVPTxPRe8hWJeBKySDY3t80yH0us_4QRaPBT6xo
Message-ID: <CAFEp6-1vaeC9oDKuPAdPNtmGSsewbHRFS9RcPMzzzWHjnXQA-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped()
 to simpifly code
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7409 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=9UnFPMSZPvWmRCPcKGwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXzmSa4TR2qQ/e
 xIKQr+vtg0PT5818poXDtGE00tS9JhJXc0bq7jZNEzswBGPN6uwFJ2Zv1SgNYIzOPxcRrrbFnaD
 JACO6S68CEAAlq8cVquKuNf39Frd6CU=
X-Proofpoint-ORIG-GUID: s3gaithhCAEfnz3PH5AgW3R1U1E5aMOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXxNiUPnNn0S9e
 stI7G7vIcIe2q4j+sctvi8EwsnrzD+gw0JWEjELw2kYmURop0dTLfnNXEf4si/TTMefkPe84h5z
 MhjyGA3UKfmPv39BrrnqFfNxbFl8GqhvPtIuSvoVRR0ODRunZpt6DCg1yVZpz1+MFFjnMb8SG9F
 azFc7ceNa5okX0+9sPEZVsiDHbPGN64D0zoXZYeH/3EL2/Bs6V0RuvkCidFmy4R5lVZ/2ctehNM
 4wi+adW3cu7u3tQ5ylsQKR19FWyJDcvT5AowGx/MBTlfqSXth0KbijnumBgE076W8CV+ZAeKqL7
 gpglqbF2SGkUrBf6thdUMap3SnMmzfjkCZpexTXN1cGW9MlymFcxQK/Q9FBJHo6rzZURo2EDgWe
 Qc4GLAQmbGoY1JJW4fLQvOt/FUF6HYj8V3ylfXkuSKdslaZ/vhElYsu4ia6qab9qxZ6YITsFiuE
 EyPLquPRHIi8kjqrmWQ==
X-Proofpoint-GUID: s3gaithhCAEfnz3PH5AgW3R1U1E5aMOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_045450_910650_F9D71BDB 
X-CRM114-Status: GOOD (  20.62  )
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

On Mon, Jun 22, 2026 at 4:31=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use fwnode_graph_for_each_endpoint_scoped() to simpifly code.
>
> No functional changes.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
> -       struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>         int ret;
>
> -       fwnode_graph_for_each_endpoint(fwnode, ep) {
> +       fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
>                 csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
>                                                       typeof(*csd));
> -               if (IS_ERR(csd)) {
> -                       ret =3D PTR_ERR(csd);
> -                       goto err_cleanup;
> -               }
> +               if (IS_ERR(csd))
> +                       return PTR_ERR(csd);
>
>                 ret =3D camss_parse_endpoint_node(dev, ep, csd);
>                 if (ret < 0)
> -                       goto err_cleanup;
> +                       return ret;
>         }
>
>         return 0;
> -
> -err_cleanup:
> -       fwnode_handle_put(ep);
> -
> -       return ret;
>  }
>
>  /*
>
> --
> 2.43.0
>

