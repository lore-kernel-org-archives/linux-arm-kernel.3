Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F20CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 00:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+yVsydLnIIHWGZobrur1ZEJjdp8Ys9U5JrzQcVNRyo=; b=NYFtABvCLtiJ6DpSoWT1oIjgci
	zbxg8yFJbQCKyLEw7YXuvjMYA52P0AS2wjvYNzWCGV5MBrvy+ghLPHvn7ndi4RY9aJA3pATMJ6Sxo
	fHCyhoSEavK+4a1Y0JwxI6nHW/DY1in4fMdbgGnLiQ9n4u4/0JfanWLqhi2LPMTJ0hzvWpgZ+deXs
	5kH+qWq6YwiNeKppp9QUElNkypRRIJzORDaG3/3w5fx+MvcSUxG2x22PSUgHoDa3+KYdNWqpjkP5h
	Pup1CmyOzbSI9Kc2tsz5o++nHnstJQJ0Xld3ekVUunxzVqJVIceRFo3rCHwAFBXRU54oymtxbb7bX
	KyDm4lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGCv-00000003H37-0LhC;
	Thu, 30 Oct 2025 00:08:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGCr-00000003H2k-00Mg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 00:07:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TM2pxt1699843
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 00:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X+yVsydLnIIHWGZobrur1ZEJ
	jdp8Ys9U5JrzQcVNRyo=; b=SkF5x2/rAGjr9OGmuCb1OIyJ8rwlSMDamA2dYYxn
	C/+GgCTLf63v69b6ZErBCihG1e9PGHMn4wU2sX94bWPba2ysjELX0YBNLFKjagJb
	rIgyEJbaHEF4udqAP/2XIVdtn1LQ4w8wc52yhAcfTYROIfcDd5/fuTXe9u/dr5Wd
	6ZH/HFCRIP+9YvSOonagH5cy5WbE2WoO9fZWPj0VSamQX1IwZJ8zMpFCVXpmPz5J
	ycLXFMvBSKGHCsLez4fVD+QATmeXh1/quRQ4yCdPtBUn9hdT7IwdGKVeqCNG2Aic
	JSnYNQKy32xhsxuOvIVkEgmR6XBVpL/uCd75833MaxbGOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ucj89q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 00:07:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a24116e89eso58171885a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761782875; x=1762387675; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+yVsydLnIIHWGZobrur1ZEJjdp8Ys9U5JrzQcVNRyo=;
        b=RGa/BYOm2S9hrAmIy2+3T8JqRyqiq0xN7a9C7O70e8uVv6oCLjLkhLD3fxhvXLn5ui
         RA8v+2hhkw70YoqCA8SFw81hqYUUgJ7xO8yKqvcW1A/7G5QtCf8DxVsnmEocB3SWSAAl
         BN/LhN6YibdRuMjJnFNyTWqPmG8aulSNlYxWxeQaEDIUPtpPzWUIuRnwD2HWW7Gt6VlY
         tBZVolWqD3TVbd6knYSgk0ezvXf7u71zl8U87AwX9v7UyBLn3vI5lGcyKaRx/yQpjyPH
         CmWG5SKcEjkngFendosakfDbHxvpLk4sAm0Zvo1LxJMGgTgCalF3F/yw7cph1jgw2UCU
         KH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761782875; x=1762387675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+yVsydLnIIHWGZobrur1ZEJjdp8Ys9U5JrzQcVNRyo=;
        b=CB3FaSQHyxbmcP+CrlkkphYm97zJJeLyeqi8TTvU5vqne9DrGfmAG/b95caSzDqCxe
         suoaGpXGsgvdNTdGIIOtvhfgxvpPfqB0eZiagVUZ80aC/KJVMYrC2BVXVeziSlHQRcYp
         GcXU43WWmFPna/Zp6uXEEfnYs385RviRa9HUCQMUpYZVNoMT8kOV+dml/xc7cEIwRqEQ
         rJk6JGaZDiadY9cea2zk75X7VBOPgMiJKMxPCdG3e5Bwray8CFK+CzLiPROn5ul5ic8l
         2LRQjsdOCAqqfo2zkFEsLj6rQjaodJFhyBYYJhDNKE++q8Z+dHcn9mbeSYbWFrQgTob8
         ucjg==
X-Forwarded-Encrypted: i=1; AJvYcCWtiUf7/T6LrBwxZtL9LUVijmb7i+N3FPITWOKRoHYpl4d7FZkcULWZzZ3zFQo+ccd2SAuU3l9+KKgwRzATDE9h@lists.infradead.org
X-Gm-Message-State: AOJu0YxdWFlH5O3zh2XDp5t8UGT+SROmAfSYXi+axQFY/pOlwU+HoI6g
	UiZVD2+1KEg/PL9reQ4Dwg5POTe50eB9Ch5oGDHUxPcsFCXMGvVbynMoPP+BWA+pyTc0wnYNkJj
	d51sBjZ7+pJAfPYMbFQZr5SFH+XvwtF/oa+EFxKUq9PnGnLiu+GVIhmpvJEwJUyidDRqDc1GmuB
	LsIg==
X-Gm-Gg: ASbGnctFPH6DfRvWQQhvII+Xea6I8HdJKtYxZL8RUXq0XzlvDmtVjfc6l/eRMfVW65U
	5Ue1dEqRyaBGn8IRCCdfLxLv/0aBw43437qf6TKh5sTRwHWhde5oFBKVTFeJIB2no8ylg52dN50
	BHP5sD9+E6z8yaVyISRhIf7c5TurCaVCLXNiAVXuGd8BoBjbnyEmutqwg9+2CEVyfBezFy79mPT
	L+uj+H2Nvm5r2p+WRo8ah8ZjxrZFX21JKV0+bTdoYsPJk37SOYiyYK/EqQd5/vXwI7U4WyVdwd8
	iaOu10gg2LB4P7/Qh8+ISFFyBZynJIP2r626nISiWNbg8XMPoTvPdt/ypH+XYg/4opQ7iSTLsGC
	+i6dZtm46BREa7kk0yCLcWSCkMmx7c3kBGplJ9TDq+SAgF8OvztGkN7A3ZgmiJe0jMTTa9Cf1JI
	9svQ+rCNlpvh1p
X-Received: by 2002:a05:620a:190a:b0:85e:24c3:a607 with SMTP id af79cd13be357-8aa2c658c8dmr184602185a.29.1761782875048;
        Wed, 29 Oct 2025 17:07:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpq1Z785daIgWtET+m4a3vPVtJCGVXN2ghxTcstoNKd4N7NLjFntKsQd9dRnSm1JqYmFTcFw==
X-Received: by 2002:a05:620a:190a:b0:85e:24c3:a607 with SMTP id af79cd13be357-8aa2c658c8dmr184598385a.29.1761782874559;
        Wed, 29 Oct 2025 17:07:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d3d6dsm37248641fa.38.2025.10.29.17.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 17:07:52 -0700 (PDT)
Date: Thu, 30 Oct 2025 02:07:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7 0/8] PCI: Enable Power and configure the TC9563 PCIe
 switch
Message-ID: <ocmd7hcplxd66xsy7brg66v5htagv5x34hcmq5seirnjobvkbv@3i6niot5sufo>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
 <20251029232323.GA1602660@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029232323.GA1602660@bhelgaas>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE5NSBTYWx0ZWRfX2pqEAKZazOwa
 fPzUmqGrCEZNFomuMGsC7OoQND59a0PgG/RFXcx5A15AXDq9dL23aKNejUSCaUXcLkpwcT9sYBW
 zfbQ5p+9ta6rOk+vsMoTKC/H8cwmYDHwIyeVRhM4TYTa9S7PwWWqNe/6SH78/hSc7WUY70MReAk
 o7uLiXORzCQLLthYAZ1L8iEyrjM5jaySo0++90soo8J8vLjSTsuzT9rZ9ZdDhmL3c5MhdtenYyt
 Wl1MNjK8gI+yAZDtMX3KXJ1QTJt2FfPlPfty7uh3KnLnD1BpjrTTScNEP1YViVtsVzhd5BexPJW
 gwohfUQ4BZZequQoyj2qppMKWM6q2q1kScCgnT0795zEMkgBqdutvYEaHPiTXE3inrJKTFGqQuF
 bGjRPpqkuhXVuCCwpGtE6ZmwQ3oDVw==
X-Proofpoint-ORIG-GUID: XZkOWbNviymj9u_jEciWT9lGdpDE5r0Z
X-Authority-Analysis: v=2.4 cv=V+RwEOni c=1 sm=1 tr=0 ts=6902ac5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hGzw-44bAAAA:8 a=YSw-D0X56moLfQO0M-gA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=HvKuF1_PTVFglORKqfwH:22
X-Proofpoint-GUID: XZkOWbNviymj9u_jEciWT9lGdpDE5r0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_170758_173691_8DF239CC 
X-CRM114-Status: GOOD (  26.70  )
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

On Wed, Oct 29, 2025 at 06:23:23PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 04:59:53PM +0530, Krishna Chaitanya Chundru wrote:
> > TC9563 is the PCIe switch which has one upstream and three downstream
> > ports. To one of the downstream ports ethernet MAC is connected as endpoint
> > device. Other two downstream ports are supposed to connect to external
> > device. One Host can connect to TC956x by upstream port.
> > 
> > TC9563 switch power is controlled by the GPIO's. After powering on
> > the switch will immediately participate in the link training. if the
> > host is also ready by that time PCIe link will established. 
> > 
> > The TC9563 needs to configured certain parameters like de-emphasis,
> > disable unused port etc before link is established.
> > 
> > As the controller starts link training before the probe of pwrctl driver,
> > the PCIe link may come up as soon as we power on the switch. Due to this
> > configuring the switch itself through i2c will not have any effect as
> > this configuration needs to done before link training. To avoid this
> > introduce two functions in pci_ops to start_link() & stop_link() which
> > will disable the link training if the PCIe link is not up yet.
> > 
> > This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
> 
> What does this series apply to?  It doesn't apply cleanly to v6.18-rc1
> (the normal base for topic branches) or v6.18-rc3 or pci/next.

Juding by the base-commit in the cover letter, it is the following tree:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6

Merge tag 'v6.18-rc3-smb-server-fixes' of git://git.samba.org/ksmbd

Not that I have an idea, _why_ that tree was used, was it really used or
why there are no dependencies mentioned in the footer of the cover
letter.

> 
> I tried first applying the patches from
> https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/,
> but those don't apply to -rc1 or -rc3 either.
> 
> Bjorn

-- 
With best wishes
Dmitry

