Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C78CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSV9Cq1e9SR7LQlW44w+/ize/XOY0Num8chSiEvfZ7I=; b=YONRSsHg8PVQ1e9h7YJ2TY4Yfu
	nXMlClvwNERJRDSwDOuVJGuemQeh1OP1N2QvvFZuCF3oOMcTTan5fdr6WBDyy58D1mUCV9ui2xsqD
	6De61VdpodAt3rRlgC44ktPEqoWuPB0AAyc1/tW8QzB4gQHeYkzQ/ZF3jl5QVGWemw9GwdpMa1NGL
	RsygamjOPiG0kCAq6Ip4rhaXYvrDY4rHCKiQEFi/mNvCk2wjD+9ej9JGHMOhV7FVbN6hF0+5tASgM
	G/2qhXX/0LtxI4I2v+j2D40EHPEnrnUNCFa86VEPgJ57zh5OypnO4/dUUGCM8cgzDtd2JI2S11TI4
	Mxn39zBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fnE-000000063PH-3PNw;
	Tue, 30 Sep 2025 19:13:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fnB-000000063OO-2feZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 19:13:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UChie5027458
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 19:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xSV9Cq1e9SR7LQlW44w+/ize
	/XOY0Num8chSiEvfZ7I=; b=e17CAAdPmEViiiRfz9DjP7RWN8bu7dQFSMUkU5At
	rqFHUetkJCwyTtYhVlMAyzfNjmQ+COIt0RzoX1LbuOQBVm616mGtDPTsEOZo/cHa
	rn3O33q//t2dUqleoTN1Yn2BSKwsu/2dzUTc2LVbD3uaTn58OpB4+sG+Rx3zfI6y
	IW2gAyQAQUta8xwKOG+Bwe9eUxSESA0SNMNA4iTS7i1lgsxOJY17i0u5tDWGqi2X
	4PDWUEcdJhCZ6m85DefF7S97zf/ylZogMYoJE3EyqePdM8mmw5zhX8Y6d6/8Fk77
	+7XnWiNhdFwJyrC6x98xfWrZbmMt/z/M9skQTSZBAX8ybw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851j542-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 19:13:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dfc05dec2fso111873131cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 12:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259620; x=1759864420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSV9Cq1e9SR7LQlW44w+/ize/XOY0Num8chSiEvfZ7I=;
        b=tzCQYu9iDVfYy2PUaAHt8m8SS0urXwNdbVpQMbXCufh3EPIvqhguRLt95HfKfaP4lO
         ka/LzOsk6EL+c5VBEEz9qo2R7Cq8XFgWZBwlR3YCKTPG5Y/TkOFSGgPTKX+WQEGVf/Ly
         80nsJuJAPIhwfbIFaQJeNz2B4YMeTmcu79I8XgcjgwC4lTEZFFvioPgb9ptv2JtXQSFv
         MBBkxYghr8nIcSgw14l1o7vD71iA6M7oYmrIT8qp3nePLbHkPd0zW/tmU73lwTO7xSpV
         T8c1emBT035qB75uijkLEGPZmJemy5RJUa2w/slEOwrysVVTzXIksZTu4gS5VGSh6Puy
         +wqA==
X-Forwarded-Encrypted: i=1; AJvYcCVV1GcCPeVmbIxdCj5+OxP4RDK9nndnqKzhJmJ3vJcnz1yVVCpUOvmPA/XPFr2U2G4vitlMHXxqYsXTd4ud4boD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1tc8Hx/2BG/4z/90BCrKzpDIilrt6jv4WbZKFn6ohc32Ng6e4
	3spYoYwqCZ1laAzgfUYzsrTsYnevnnKGJ1pqrvpGXFU+i8UJtObxyjoLA+yDw18pwbKTDb2X9N4
	qsfX/STniJC0x41p3luUczwlCPD/K4FlvSu8jDJfDJKv1qYg6mKCTWITt+NcyT+JsLOKYbEsP9i
	4Tzw==
X-Gm-Gg: ASbGncsvImsLdL+taqXVazYbwJow/M6J08ecl9/3Tkksu17qiw8MERrw1VJkQct5qAm
	9m+bl3uTtUPKmKJhcuUx7lS7VhVfTAoBKrsWShr5ma+6K8Xu8VQOqIZCajaeRHEfexUN5V6eyDU
	Vr9olzh7deLV9RfZSQ+9tZAsDBWWQyEa2zRyFQU296sbkEZF/8SObX9tzt7aJUbhQOAAk2iB6jE
	5XKOt1HbvdecsoVHEAjzwDBkN9RfFimifTRdiTgSlEzPc1SHaOuN+q6Jyz53N0Ccme2YexQv3dV
	+fayjdxJ3yNnFsuMljHpbjYbLweovTgKxM2seznmclzF8s0ZS7SPEMJsSRWPNympjF24TqG82SE
	afLNrfgq5v9b4iNxC0xZ/SYOt1B18Q8TOff47oY35GN7QVXXzDNavjQE8IQ==
X-Received: by 2002:ac8:59cf:0:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4e41bd7a0edmr10557481cf.4.1759259619551;
        Tue, 30 Sep 2025 12:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWLFpkh8hsbF0BWjWEBKzr7EQDGz46NeB9GyBzVRvHn8dRxUQboxhAGEfSv3X96BGi8K3Eww==
X-Received: by 2002:ac8:59cf:0:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4e41bd7a0edmr10557091cf.4.1759259619073;
        Tue, 30 Sep 2025 12:13:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583134312c7sm5264888e87.8.2025.09.30.12.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:13:38 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:13:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <xxvexvdedkzbvhhoh6tubqkbrtxjskhgjockawa22onzwqusp5@iggjnospkryv>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
 <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dc2be5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=0GIP9b1rOs9S8cRHSfUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX8SKg5xvlu7t+
 OfsGaDu3OW7rzrp1B7MrERY/Tw2hO8yWdEUQqwJ9pW7TxJmjurCvZop4FgcEBhHwnwRjBOBDI48
 g4uwB0Ei6h7/4bSxogWjTXtvyjOFnKTGud1a/o/nDvQkHGrYDFJpjNTFu4+xonVvvJF0tybx+fe
 zfrbhSEdBVxfEETCMbiMFryECXCv2Jat7C+/1/FJJlqyPsErgWeA+zDkBQtbnjIWBCF6AfZWN8V
 27PR3VF6wY4IeV1DfcqNBwiFrAwiVLV1jV69U1N8Ze4HgcCNMBq72qhhMUhC9XJETolFk03lnjC
 M6IqMQWH6OOYobmKhlC/7+v7k5XMmlMgX3TYt6+NXPbiunqnPxs9iY9hQBcuSZuWTAcIbchyict
 Rrhs4VMEQX6hez9f50YqryJ1v6jrxQ==
X-Proofpoint-ORIG-GUID: 5eDp8-CWsnMGuPLgMse_l2GkRGTjwnk0
X-Proofpoint-GUID: 5eDp8-CWsnMGuPLgMse_l2GkRGTjwnk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_121341_683612_4492C019 
X-CRM114-Status: GOOD (  22.67  )
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

On Tue, Sep 30, 2025 at 08:48:13PM +0200, Neil Armstrong wrote:
> On 9/30/25 20:43, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> > > The ports definition currently defined in the usb-switch.yaml
> > > fits standards devices which are either recipient of altmode
> > > muxing and orientation switching events or an element of the
> > > USB Super Speed data lanes.
> > > 
> > > This doesn't necessarely fit combo PHYs like the Qualcomm
> > > USB3/DP Combo which has a different ports representation.
> > > 
> > > Move the ports definition to a separate usb-switch-ports.yaml
> > > and reference it next to the usb-switch.yaml, except for
> > > the Qualcomm USB3/DP Combo PHY bindings.
> > 
> > Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> > and keep ports definitions inside the usb-switch schema?
> 
> Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

(Just for the sake of keeping it here too): your current patch allows
using mode-switch and retimer-switch for the fsl,imx95-usb-phy device,
which it should not (because it can only be an orientation-switch).
Likewise our Combo QMP PHYs should only be orientation and/or mux, but
not retimer. I am not sure how to solve it without actually allowing
properties to reference nodes from another schema.


-- 
With best wishes
Dmitry

