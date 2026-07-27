Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFEBC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=; b=4MxlMMWW65FQau+0EQ216mnmDt
	VQ/F2hxa4aMG9FIEPk/JU9lsf3cC7cqsoivtx9vXDD2skvz3HOqXg/DjejUEljzrZqjZ/gnyLXqrk
	pa/JBx4D/C0x1nEgkuSmR1Q3q+B/1p/X4yE475sgbQ2a25tgxMKe/FCgAthZ6m4Wd6UZnTq0L3gKo
	o5FsayfD1j8TheJz8upc7znOFoG0QR55sWC/QRcU02Zx4ahrKDEuLfKbg22e1ukIG9aLZqDx3HmzM
	J5ykKB/DvRsh6aX/zdFmCdvG4YcUGDb8nNMCCwKrRaqh31PfKXtFPOssczgjNcv5i2L5yBj4htrc4
	Dnz3AoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLof-00000002uga-04yd;
	Mon, 27 Jul 2026 13:56:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoc-00000002ueJ-0SzI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:56:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlXIO855714
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEdThMl9wB0HUHCapGlOKYIA
	ukDNxU4aWNkFOAojSDU=; b=g1hzPGYB160xdVffc+FN+nhqdoD2S9y4lo66GNym
	g814L44HzLD9Unab1F4KdsqZuIEHoNb0Xb/Qidmg0IJvMXzneA+Ha3YK/BXbpWDF
	zMWNimzhe+y8ygHKm7OIR2Y+HZQ8TJDHlFXJyXq31LT1pxAhhIavcxpZGpv9gJxv
	gkCx2F2ECpypciJeo9O9/SxSJxnL/PmazhV6lo98DjmYLCfH6mMPVGI4ud8Jaruq
	2R0QUNp0WlZUiBqJG2FL+K8LD9oVGIFpKWydJSevetfvxSw7Y5yN3jy4/RffmK/H
	CrTpk12mMMbLbo2idoInnRFFnqKJuPJrl+pSpWBKXWSj/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wj8ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:56:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so34661061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160581; x=1785765381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=kL75P7HM6EqTuJJLAf3v2Xb+UrCEX8C50DwCz54XshMH08AzbiI3SRKRW92HodeUVa
         5RfWtPyvZKr2XqXSemOV83DA+T3eKvmsE/Byq7ufoKW7cA/L9yl+AgOSkshLbAdBNStM
         45BpvthAZ06r6fQrI4JKHCg6Vibv1Qqe3U7iZwgaAIL/KnVyksshEMvn0RF882130pJ8
         EHzj2PZ7hYz1i2AQ5cUCS0Rot4hVyUs9Pl4YKdNvQtHlnn5X54RLi1uJjPNLai0ML3fC
         RmmIS1XBRiOt2T36vjBYPiiauIYhtoBGtx0/ytO/GTA+3o9ULJlLt1Wp+x05IIs1lhxj
         HEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160581; x=1785765381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=re1Rm/hLf5CcNbGKY7nOshoFuwZanVdXaFh+o0I+D3Twg6KsYXBDTaz6VwTqZU4R9Z
         Hz/zaCBOH6xfsDGB0/Bb40ZvTTtJZVOS/HVEPDD9Y1IyMprqGv91CFeBYXXyqTrrJQSh
         ocLhex2fRSqbILQkoLrSwjGO7Hiv/h9kF4sPKv1mE5PlbueSDufA5VKvyVwmmgbRqtC/
         MlHSUtFHw9InFVv7Y3YuDMdNLAbzeIbmn/C57zgioEZmF37hlQNL0ad55a28flWGRAP5
         P8UoYTRCMeJyXwCZbBShDzQIOnqfiVQ2HDZ5Myg6TYOnNf1u0k4Z6ot1a1iP4WR+SEe4
         QEIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBRjAosJy675Jiun4aLP14ef1b8W/iUtIILeCCzbguN5gt29UpADxggsQPtbglck9N9FlZCUoUVBPO8QpGGX49@lists.infradead.org
X-Gm-Message-State: AOJu0YwaJjrFuSCjrL4VtrHQR5tOu8vvtW3jOeGgsr7NOtNFy2Xy7UV7
	xmDqa0J9ukouE6MfY2GRjAiRX10Amh7/WPYmfWueLQx5TtXQcKuG0SHKcyQFVZcg8rrzjujWZmQ
	GzXfFRS6cjTpJe6ha+uPGD+OB31c25M3oDqCnyhgehruJUgIOwbjucGrtJrT4xb3wUJ426NGr6n
	qp/g==
X-Gm-Gg: AR+sD10k1/vW3XvWYhsDvn/bsk2H8U0+ofKAGqEHHSFujUU5hEZnt/v8c062AqNIp1F
	StLkm6/nvUZ/wZYeD+QNtw9fabzBQpx/cyP/456wcYE/ybykzMUk2a1mINdMCWXthXmQxYHGm/h
	aBszHASUoBTUG0pJhAMa1IOg4mJp8QgpxqeS0iizmklF9OcApOoZb1Atb4oMKhYmGT7dqFZvU9n
	f/DaeiYH3Ll6BCk3+xsq488Vr+IRuTq/4JxtotXzr+kO/pL82Qtv/VLMc/BXbP/o9LP0dTlXHjv
	jH2dNasFFYT+hikfB7xqAGr76tjWCgK4trY3NfEuKL7IExcdljBTiCXUb48yZXvIzQ0IntktNZX
	IfPcs2Ut8PalFqQk=
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239671cf.80.1785160580705;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239081cf.80.1785160580162;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6ef25sm45010704f8f.36.2026.07.27.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:19 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:56:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <rv5s3s24nyzg2ue7ywspu32l23dqhwi2rupcrdzx7dcdgtbyap@pmftq6x63mpw>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfXzrUv4SkFqNJh
 zvxELsovTd9B4vTZWZ9JaDMVpmy6RKTfiNLXt/owpxODX2TGxTGBK1ma3jZgI5EKb9IA5ePkifY
 un4dXqwGtJMRdXwsUCgPyVaSq8S9x61BaKzk+JpXZqmhbxU/SYIkb0DJ3ZvYzODt7JuhdVtZT+9
 9jqr/tgkx9EezKP96Ldn8YLYdoWy2YUJ1DLr5EP/IkIVxXdqpcK7bk9JH8IvSjs5C2SYlym77ot
 WBUP+oyfeSP/NByCUpsYTXoKQVN+suYC9Tfl417gecdB2Qab0lRQFsPM7K4l6Ut80cOho0Kl3RT
 a7gClXhHua5xnhw/qWQhz/MVlEUnEFnymJfydB2ePj/4fk5z6V2lVFtHtmdPGjZUv/M4Sh+oZhJ
 ql+iM2wFcMYS2AVyEJrzlcJ5rIxveoM5nK6XF9gAeUykcyQoEvaLP1BKe2p2Ma4CPs0ei9UnVxh
 b0XjD8LMGpFaMBITp4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX5fKR/63C9PJe
 6N8SLBuu+BK53E+80tFL/X8v6s61115GXQpaRV0tKjZGHpXtI+T8fKIhbDe7J1xB4+I/+X0hPL0
 pv7LKEjXgaCbTsB/tj6o8YqmGl87sOk=
X-Proofpoint-ORIG-GUID: F_ieEoGWJnZQ_NQ9bcFUJ4PMkA9EUduD
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a676385 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: F_ieEoGWJnZQ_NQ9bcFUJ4PMkA9EUduD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065622_155075_3B80B0BF 
X-CRM114-Status: GOOD (  12.30  )
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

On 26-07-17 13:01:51, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

