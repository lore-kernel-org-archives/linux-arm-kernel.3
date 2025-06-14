Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8782BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9Yz9eeOEAB6gwmE/XjUJssKvHuIHZG5zhBMZH1Z5yA=; b=iRo7p4SsNiyR4AR3IGEIuepT/A
	wBNxfOoxKJP6Ekp3TbFzEMo2ypttM5OffS4OCMMC50vbg2+sJ/14hM/cFZ2jdWn17i8CCSeqIe4UW
	cshiJ1wyYlJ1K0sSs2yc6tCnN+bQar6eRrm09gPhwSAbIZeKDVZ3fGOwZcTntvaOr7mnhFu4ncxfM
	TkVGfwvrdyTBl8DM8UzFpT+n00lqrZm915EhZJ82XQiXHabsV17hUtt2XOvvg+y7qSs2HtT0uWcre
	4GKyqOiMzc9RSesnYQIp4W7JxAJa898N8vsP18jJk5l2VB1c8Xddv+wBzeF9BrBBLVZEjevVSMBwY
	+13TykrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQX4J-00000001mvc-3qYp;
	Sat, 14 Jun 2025 20:01:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQX27-00000001mpl-14Mq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 19:59:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EFwTH1007726
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D9Yz9eeOEAB6gwmE/XjUJssKvHuIHZG5zhBMZH1Z5yA=; b=dAMvxHGfPG4PEBnn
	4YUTpSk+0+m8gwP+g0AVnupkSOtc8TxpsPuUpn+mQ/1K6c/Z8Mqb2PdT/Ar/I1X5
	7CLLBd0dazKzV3QNASAhB46pQ8EkeqAsM3x0+LIPrABaMJvRuoa+lbh3gXmhmLRV
	Z4O4hyUfV/+gWjdrJgDPVXse2LGUCFXv3OYynO/ECvgfdBJGa8DCK3+LvWJdtXaz
	sp/O7RIX5ZfT7E5Nvbk42m9hA1aXhGpk8q6HvfVFgY8blWLG4FcWtWz//I42GS5Q
	Iu8+eRf5QjdyzkTaUfjIhbeBLY/t8xUL5n+Y6dNeojBYbgNzyonLz8ll4Er6xMrf
	2h3oDA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f70yhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:59:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fac2041a3dso863646d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 12:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749931157; x=1750535957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Yz9eeOEAB6gwmE/XjUJssKvHuIHZG5zhBMZH1Z5yA=;
        b=te/MkwBuORZqM7eF+AKs1Fx0G+RGSOCf2yR5TCd7bmBSArTdRRfz/A3/9usnUxpVKq
         w6QdK6PWTcoCOyMsHPxlsT2+7/mOao3dEMatmdEB2i71wD3BQnoo2fGaUAhOwoF4qRb8
         BHJBTgkRY/PoKz/o8q6ZALKBCsw6L4StL00PB9sodVue+seDebQetBkUl/8P+ZBtXp1Y
         QeeBHHbY3WzhwFJndFb68yGDX4B0xC+aJguzeV0J7s/GFgfgyBHdBuv5wnRpNcXrTjlc
         fNByJ6lunfsz37frJ6s9nXRx4yPR1e+7HEpBD4hHFDkfqfG9f3cu7h5HJDkRn4uoEcSJ
         oDyg==
X-Forwarded-Encrypted: i=1; AJvYcCUwGpvhkprdCR+XW4tm9jlFE9+i8AvhhGp7MK57GhGT0cXJEsrIabvb8eBKXlU4moUS6O7uDNo3dhhrT9dGqbvo@lists.infradead.org
X-Gm-Message-State: AOJu0YxKQD1RYabJVNwWpCFc6h+6W0UXaDvVDF5VHoJKqngLNCK+Kljb
	L2noNwz7CUcIgq1roSeTLUqiBd3++iPIKgyod7IauYN3d+xTkjOjm6zibwNICE10KTIaMP5Y+vj
	VhUVrMTaesVyFZ6Lgw4qGEGeBkKuPLvDprrCIMq/Ez73MmILUJ6IR2jaxFgxLY9SHadWA2MguvO
	nOuA==
X-Gm-Gg: ASbGncvN2UQPfkRgvKSfDqD38YgYnlZMD/KLNuNXaDkhFcQDZa1P047GMHB++ZR3EHh
	hzd0AuqN7xWtbVlaFqfxrWd3TSTlt9Su4d+fQf6Kmi8avlaTTFqHyEu/DXT2uTH8qRIzgDnrgKR
	+6ZeK1TDmMxx/iNLB7V5MiXKAsWSWY+fAvrrUXZ15Do+0K8Zr/gslGW/WQtwIv9DJyb6kYe4c8z
	TkHTMnmReCDZAKsGfDJ4pnzEOGF1VPp2zl2YvEEk/P7VT16DOjXQBggbYL54O9Usx75WNZ9a5U0
	f4nc4qv2powzx2HMz8MVU+PghBDeVpPbNucr8NFcCmW8qy7LrF/O6zH5yKmryWnOX/9g82WkI11
	+RcY=
X-Received: by 2002:a05:6214:1d25:b0:6fa:fcb0:b899 with SMTP id 6a1803df08f44-6fb4779b7edmr21624196d6.4.1749931157277;
        Sat, 14 Jun 2025 12:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfvXu2z/Eu8GxiF3dbJxs97S6hPTXH957lzGZe6VLmsR4eBt3mhoTtVoO+YoinFTILZFt4Q==
X-Received: by 2002:a05:6214:1d25:b0:6fa:fcb0:b899 with SMTP id 6a1803df08f44-6fb4779b7edmr21624086d6.4.1749931156870;
        Sat, 14 Jun 2025 12:59:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d33sm356206366b.31.2025.06.14.12.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:59:16 -0700 (PDT)
Message-ID: <296a9ab8-04e3-4623-8246-c8fd3fca8d98@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, qiang.yu@oss.qualcomm.com,
        Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NiBTYWx0ZWRfXyMghkGt1yHpD
 3mmA3ict4RKe7RgbabUv9bZf28zRaJ7pz3vV6b9MR1moUf/Kd2059BdF5MHFFiKu4lqSpZIeyzl
 sOy/lqg8axbrnN1yTY3UR7SKgram2dEWT+SeV2kYh2036ikcDWDeLzY6SUCWEDacK73BMYJozx/
 Od47xOZNBq+N9cZVZCgSWSCE/g29SQQghERTPI04uxTUmXQiXNr+GOESDGYC9CwIsuDTNRUgM7c
 hGPFVwd/NqfDR75QBz/5y4Bp2gfzXceu2qhuDl8tEo3/GhJ20Xz1JEYCckFvUSBZlo86WPUlYtV
 h8A3c/GFBlGXuBAFV2jseNbz19ya4zJ/2rCyU/1ItRMIrag5cKEMgk9G8XWQufaWgxNbY6crHEz
 URYJgVSSxkbaY9tqw7fiUaQuAixCBgXasQkFGvkYMYVwD1oggTnQ+pbJa6QisrM5Sie/L66f
X-Proofpoint-GUID: lgNzHr3D_8vAehk2SC63-EaUQFxSMQUX
X-Proofpoint-ORIG-GUID: lgNzHr3D_8vAehk2SC63-EaUQFxSMQUX
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684dd496 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=6rhPmxELWQzppWOSQc8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_125919_419538_0FC59BB3 
X-CRM114-Status: GOOD (  21.09  )
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

On 6/4/25 5:10 PM, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>
>> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
>> clocks provided by the TCSR device.
> 
> As I just mentioned in the thread where this is still being discussed:
> 
> 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> 
> you need to provide a lot more detail on why you think modelling these
> supplies as PHY supplies (which they are not) is the right thing to do.
> 
> Also please answer the question I've asked three times now on how the
> QREF supplies map to PHY supplies on X1E as no one will be able to use
> this binding unless this is documented somewhere (and similar for other
> SoCs).
> 
> The fact that you so far have not been able to provide an answer
> seems to suggest that these supplies need to be managed by the TCSR
> clock driver which can handle the mapping.

To emphasize, we apparently can't do it, because there exist IPs
where the QREF *ref clock* is not expressed through a bit in TCSR
(which we interpret as TCSR_CC), but the *supply* for that clock must
still be described somehow, as it obviously needs power.

To add to the mess, it may be that there is more than one supply
per reference clock required (which is not necessarily an issue
when the driver takes care of it, but something to keep in mind).

Konrad

