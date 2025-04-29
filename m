Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42281C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZu3TV8trj7jEXy9C3oxl4Sy0FYWykPDbiLWiHrWJao=; b=rum28evpkNc2pKDQnDiEIYyxO/
	PuR1tceUmhL6spIHifWxkeb1SlLev/8O0Txz2503vHQisN8hLlbk9Q9jPiAwldWh59n20hmCY8Ppr
	+8R/4fGMMpbEgvzOww4r1alpRG7W2c5L68LqYsuZnqBLceB/E9G3yLfLjC+OOVhi5eLsUE4zZG3I+
	rRzx9W6UCy4xngUbt6klCS94zPREQMbY1ipPoAiwh61hzVIxQNXGqkcsmLfd6kzAKBwEs1T4MlTGE
	tfL4s5y6laVBNSyf+CP4wiCCrC397olEcZ9y8fwL3nlubnVzc4c0dCcCOzfEBFu9J+3dvJZwOPhEj
	Fb57cYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9epN-00000008dhX-12yZ;
	Tue, 29 Apr 2025 06:52:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ejq-00000008cij-0Rpt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:46:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNrrFD014932
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 06:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DZu3TV8trj7jEXy9C3oxl4Sy
	0FYWykPDbiLWiHrWJao=; b=N6XDVcY+mrQT+m461o4bwqUWem/L+QiXXwUoTQT0
	lyHKLGcln/unMyGQcwf3WRs2L8baOoyGPxiO8Fi/7QY863ItKpelgREWLF4Q56DY
	a2y4pMer6xyrT7r6p+TKDcBBG6Yyfj5B3/+xfPSX+CXgBLj+VrNHcsfk5JHYW6rG
	0bQA4qxj155NOjhDwrUTJwVwUNCzpyzqoR4s2q1rTWv5/UL0JWpMaFZnnCOodCbY
	8Sbji9o/STMdR9CM3wM6C16DPPrgryVadXWag3uF19gcNf8KURm4R2fLwomWVN46
	8XbEMtYYzl9uMe1NEUhr/iq9Bha0/5C7U3N1Xo83+s6ZJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn2efj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 06:46:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769a1db721so145989861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909200; x=1746514000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZu3TV8trj7jEXy9C3oxl4Sy0FYWykPDbiLWiHrWJao=;
        b=mXaOyETpJqYsZ+8iUMY61e55ncwCOfuTF+TNRh6txuPO8gBDtomBwyKqLXtIctU+SK
         20wW1QTCV1Y/pk70jNcHKLyeJ3+x2y9M7WLhsFHQbLI5j1KyFafP/LywdrtdD8j12Ho+
         pTkVyUWlvD+jGHtGzZjhKSweA98NkLag3LsjS9AzlacbG0/2oIpUsra7JrxHqkXqRx0w
         b6oV+3HMn1eD+h2mMyXtndRuPQBTi0ax/n6dp6mV43bO2FskIYuoctM+GoFg5tDuZQEl
         tiwrVECGCje3Sei4wWXd3n4rGjCACU9aoFdynCVCMmEjQUbSDl+/2o0VaLS6zyMaf4vD
         rfGA==
X-Forwarded-Encrypted: i=1; AJvYcCUyiYw64XsKi4w2W449l4wuXW4B8mK+kuRbfdkzejUnY8FjaLInUsJaN+IZeBslSF8Bwg2XOrDn2ZazXspEhhmr@lists.infradead.org
X-Gm-Message-State: AOJu0YxE7b9AQ4QtCABTnKTskO+jcIAwAj3Y0izUY8moLkn98WWfZqaA
	3FuNtzTfHLq9ZlAmdw7I11X4X/Pz7TBtBa0Xl2RaXCBuP9FL67FE/1DSPJ/W2eYuwmuoHjE1qp8
	Ja3Jc5z7D3hajigM8nYLlTlpxWGFqGT2A95nh7aZRJ3gzGPpDhm4uhf003debBVXTjGY4x++KFw
	==
X-Gm-Gg: ASbGncttawdyNizAHpmDWUjCN2kLaz0o6dsf7hw4FLjTPdMFVQe4Ywlm7XfwSBzXPp6
	HzN9KWeDebVVy5+A5OEh8y2IKONljpa48WpkviqXPN0AGVgHrZhKXyJDEq6MmI2lps7Cx/vuv02
	u1LeKNEpZbKs5MCDxrd+ltC3o7/iOSKtDPc6xt6n5UV8WLl3PTYwwJgQKYVYiX+UvJc3ggpHgS3
	vronpdL2CDuVJr0dcHvJNxstzoBCH+KSCYo5Ev8b+2Cxnkb7GmEsd6b6l3hBbFI1ddPnGd5gZDc
	JvIjZ2+gvpHkFGHSkXvoi5EXoHgA44WmOFAkadZ+SfAQJj8NyW22giAQpVvji8wU9jtAWIG4k4c
	=
X-Received: by 2002:ac8:7f8e:0:b0:476:a967:b247 with SMTP id d75a77b69052e-48133562059mr203907661cf.47.1745909199806;
        Mon, 28 Apr 2025 23:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMg1rHdHs2/nbrDBu8fCMcRUEKSoFdhUgPQjOmgqhIt37Lk0kiYKjrtVvVlpe5Endpr+SpyQ==
X-Received: by 2002:ac8:7f8e:0:b0:476:a967:b247 with SMTP id d75a77b69052e-48133562059mr203907431cf.47.1745909199361;
        Mon, 28 Apr 2025 23:46:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm22953181fa.114.2025.04.28.23.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:46:38 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:46:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status
 means attention
Message-ID: <zjofw6fe5aznnqphtneccj426vqpbimm23kcpi3xts6p6zhftk@kjhrxvhanamm>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-2-swboyd@chromium.org>
 <6eeb7bca-6018-46de-a7db-7189d60c0942@oss.qualcomm.com>
 <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53ypGBXAt3frrbfAsbJZEkxK4BCB0+3MWOFRxZ9E+6P9Q@mail.gmail.com>
X-Proofpoint-ORIG-GUID: sGdw0ANpbEzZvoHD9YDmHLn8vHE16GSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1MCBTYWx0ZWRfX1GUrahOgMJY0 JJG5wb2yhlFPzvmUbp+hMGu/Lfr9SoWtvVRcQdGTIa017/A7L/uW7QBoxQUfTeGj3YtwhexCe4u 6itUP3Bif6CIptc5SkiZxP+roW9nz/ZyOPFeSJrB9fYCLxGrWlaqFmh4bOpSiO5sJBktY4YX7Co
 /fXptkDHQyxi29WnNWe35s0LVUDZoqZD+KcLoDhEeiWyZgCWvrbwtomu0nQ87C6c7pVCKDV7fIb eMuUOBMatXqUgi6Zs4zNs3RumTqDv+lp4PXK/MgdI9crgOcUaBjkIxtpAgBF1xGOilYn79vlCKR xQTtzUOAiN8HIUJOeFovOYoNLNCeId+GAT1zX2y1RLnAc0p4T65P/GxGIZp6bYjrwzN2eGKEPAE
 vul5BM9tZ5NjyRJeWl3DSdNLHTA4FYYQaJlkUYc/5s3x7z4GhYQyUbsTQl1OS45vfLv/t0HX
X-Proofpoint-GUID: sGdw0ANpbEzZvoHD9YDmHLn8vHE16GSV
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=681075d1 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=yV4NexEFXbUgmP4BVSMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=629 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_234642_162929_6647ADD9 
X-CRM114-Status: GOOD (  21.15  )
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

On Mon, Apr 28, 2025 at 04:55:27PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2025-04-22 06:38:17)
> > On 16/04/2025 03:02, Stephen Boyd wrote:
> > > If we aren't expecting a status update when
> > > cros_typec_displayport_status_update() is called then we're handling an
> > > attention message, like HPD high/low or IRQ. Call
> > > typec_altmode_attention() in this case so that HPD signaling works in
> > > the DP altmode driver.
> >
> > Fixes?
> 
> I didn't put a fixes because it only matters to make the displayport
> altmode driver work with the typec port which isn't used so far on DT
> platforms. I view it as a new feature, not a fix for an existing
> feature, because we don't use the altmode driver.
> 
> It also seems like it was intentional on ACPI systems to only handle
> mode entry/exit and not HPD signaling per my reading of the mailing
> list.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

