Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6B2D216BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=696GRQQxqyCN41tUvMfT2OP6gr0o5pHGbrT8RfFEnEc=; b=F8V09G6sXNej35XbRQomxzKrPn
	6JVQ2rR34posL7agSlkJt8NhZJXQgu+cX/05wMAdNtQQqxMJ6CYAeH+4PDB/yQoipUX1SDEYGAApy
	rx57L8kv+Ef/moc4ELTpUsZXhveNA2qGbNleJ/Qy7dhEkRmtaHAa794x0KByb7LPIuV01Ejq9/ogw
	eK9t4YrnmPx0x7bt4N6h/zgZnk8LfhxChZ3BOGfukM03NT2lNJhSWJcD62gbAhQFx8P5+Zpk8Szgb
	NuuzRELAn7QxvPGuyvS5AzWIs13oMC/ocRynfK/Bk4zICrjuWdXREPIX0eIDIoJ0dRK4jAjVpgowm
	TGb6tH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCcU-00000008K9D-1Kls;
	Thu, 04 Dec 2025 16:55:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCcR-00000008K8l-2S56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:55:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErv21130933
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 16:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=696GRQQxqyCN41tUvMfT2OP6
	gr0o5pHGbrT8RfFEnEc=; b=Lx/3WszRZx71yC9TsS/SJ7/ziL4tv233rDSVnAVW
	qOu8Ig0lpdfpIRipphLvIWnQjOvJzPk9SjcKVieiVGjfBCVQIWUDLCygmvfsNjz8
	Zo+/6QFqQut8jnDJmDaukOqg/wAbGL7dqd+E56N9It+RONcEMee6WZ9xFpwBJP7I
	zq8iBjeeG16yZPg1Hv12Mv/JCAxlFu75VU31gmBeuMI7KRgLv/63eZamGs6GB1Sq
	zzh/lIk7zP6Hc9OhYDwaHMT73gaCObhXHuMhHogl2uaHVuzb1JK8INKNohQfirG/
	gagyvGpktQIbqIKj1j4DbEceUtiC59OtUrSyD/KCRuqVAg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f02fss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 16:55:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b895b520a2so1100444b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764867349; x=1765472149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=696GRQQxqyCN41tUvMfT2OP6gr0o5pHGbrT8RfFEnEc=;
        b=XX2BFKMOXrVCiiNBeA7dO0EZGQaSKFYJP4/NjF8fSUASxsXJmTFzZGRjYMsRqjVDNg
         w7HVb7/qRN37RIvtHWBa/I+dWKBG6RcHK0c+9uwS54ZdZaoljy/JkMi16+kf9qMe6gmD
         vV0D5vY7AMEgvRVC46zuG5yTyCj+7LXCTtssVFsLRLo+mZE/GfvbGkKqxx2ijVGrmSTg
         GNwyNPfcreOdQT2wvSt2i9QFVEMiLjXB69Arlap0HdRoh2pyvrbnr5+P3UTRSbQfMzu4
         1gFZIgzwS4gTA4o2PoTG6sTzf7k+DxTIaOGh4dA2GZUueuluHhPaxD42VNPE1gHuItHN
         cMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764867349; x=1765472149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=696GRQQxqyCN41tUvMfT2OP6gr0o5pHGbrT8RfFEnEc=;
        b=rN1b/JUP8JqX4Sz0vdLpE6t5/qaFmBuEU6x+3g9h0k/OtueXoJYBl5MRvpYsVx91oo
         eTYno9tzYoR9i/aCGoprlzaxKaDAavyrkejkT9u3Ill6NR8u2gLtT4gqmDg/kG4pAjqg
         Pk7SXu7YQI/lYidmFrZ4tyH9gx4sVwqWlXS8ag8S5NuJjijxaiUvdUHpni5ZsIEPsycw
         IramKoHVKUrDirTiVkbOgRwYuTpQT55c8uZgTvz3TqeMQOWuCEy2MjjgXBifgQgQ316R
         ORLQycEozGMUgOa4LO1iLt/TAfgLSTotrorC9dwejmeChYXWUh1SGPuuBTZT/VFQlRkh
         NECQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtEPxGPUlfez/gwAdqma7RJgZSbSVFQcn1+tcwjdYBYJSh38TwHQk30sUDy+a6sSXmeF6XOB+iKb2M2R9bY4Z9@lists.infradead.org
X-Gm-Message-State: AOJu0YyXfAAgtOor/weDO+spgG6h4u1nZxt/IX/NbZ0635sBLeb46ByB
	urbJOVimKzfBbKC1yum4i+H2MYBCpVujocLjYt2Jf7KnTabf0Q0svvhO0rVUgdRYHqJhuSs02Qh
	60WL4Ph/tdDK8KMJKG9xrE98hGgTdohdlyYhKjydEX2A9zEK/+VzuHABUC0bhDYp0sMoDbur3eD
	+k3A==
X-Gm-Gg: ASbGnctYE2MC2SiPl/kPBxMb3k8gYY7bnyvgn6tke5aMCPVIo20PnEaXXFRnNl8lYRN
	gNU38o5X2cRI6HS9SZVLudsmT0fAAsF+Se2eyNKAuESA2UiEigVqNz9aLCT6n5ZJkI4AaH/1LPe
	zD8UuI7w4mPRmfROTDKmR1did90e1/7Hj7e1kYe4UWraibLeRn3lSG8oWEtNFRI23sHOQsk8IUt
	7XfUJpQgG9zTPxyhM1Ok7V3cYJmTfLO8ziGPJ+PV85nzw5Q2lQn4U3rOP1X7yBr7vrP5n8R78hj
	Sgfrx7Eyk2W4oAzUFBOxd4k1hz+XMJr/0rLCgEDLwUSTGDoXSgS5Gd8qZbMFBKmXeoatSY3HFDm
	YQ3iUGyrNbo5oDLobe9ZT/mCFAGw14w7DnWomhocNUGY=
X-Received: by 2002:a05:6a20:7f9a:b0:35f:27d:2ded with SMTP id adf61e73a8af0-364037bbe31mr4323544637.25.1764867349089;
        Thu, 04 Dec 2025 08:55:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw2kT6hEWnd272sKBcT9eqh7v0Rt/OEQRgifO1zaMD5O5RJ8rQVzs+BV0eYAiBOr9b7Fd7zw==
X-Received: by 2002:a05:6a20:7f9a:b0:35f:27d:2ded with SMTP id adf61e73a8af0-364037bbe31mr4323517637.25.1764867348579;
        Thu, 04 Dec 2025 08:55:48 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm2702035b3a.20.2025.12.04.08.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:55:48 -0800 (PST)
Date: Thu, 4 Dec 2025 22:25:43 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rsalveti@oss.qualcomm.com
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <33ab9112-39c5-4dba-9e56-089b7e8a7243@quicinc.com>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
 <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
 <aTF42v5dpTuCe7r3@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTF42v5dpTuCe7r3@J2N7QTR9R3>
X-Proofpoint-GUID: wQmwKBmoVanPPS714SOWWhj7OdDdinBI
X-Proofpoint-ORIG-GUID: wQmwKBmoVanPPS714SOWWhj7OdDdinBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEzNiBTYWx0ZWRfXxDbqkAeNJTTt
 ZN1KPk4MCIkv9fOzlLdbGtRUvXrHctHQGO9aC9/ownSHobpE8mQLecHCGv1Toll8Ysmq6IZw9NI
 LEUiQm8n1wopZPOH6/Hjgxzx7rIvWdax+dm6Yp/7YgdkJ25twS4d41biekDNATreF7yW9rT7hyV
 FH0t147C3wzb7rYqR4MqnybRiUZEHYK7fUjddRjU35fsV8k5jtFt7XWY+27YNt1QkQ7qAVY582k
 jtdm9Olu1mtghF116F4C6/97sEyMlGJmyAHmivJzbQMrD3wv3ESrre+x7MODqy8le2A3gV7/jWY
 SFpFpITbSYqPDeFQ2RwDINVWaMoyx858yBvfkGhqR3YfNUeKVubkdY4upIkqqnhPu3ooy6tFQER
 h+HQxQ6vnLbsW9iTb9WwlnlbE+3IYA==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=6931bd16 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Hg61_yuSoULxYLHEoxwA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_085551_757795_BFFB925C 
X-CRM114-Status: GOOD (  35.07  )
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

On Thu, Dec 04, 2025 at 12:04:42PM +0000, Mark Rutland wrote:
> Hi Pavan, Marc,
> 
> On Thu, Dec 04, 2025 at 04:06:12PM +0530, Pavan Kondeti wrote:
> > On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> > > On Thu, 04 Dec 2025 04:07:15 +0000,
> > > Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > > > Hi
> > > > 
> > > > The pointer authentication feature (PAuth) is only supported on
> > > > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
> 
> > > On what grounds? Hardware incompatibility? I seriously doubt it,
> > > since nobody glues pre-8.3 CPUs to anything more modern.
> 
> Marc, it seems like that's exactly that's happened here. :/
> 
> > I see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0
> > (A78) indicates that PAuth is supported but not for CPU#4 (A55). I am
> > told, there are no other controls outside EL2 (trap) to manipulate
> > this feature. So, I am assuming that this is indeed reflecting the HW.
> 
> Cortex-A78 doesn't have pointer authentication, but Cortex-A78C does, so
> maybe you actually have Cortex-A78C?
> 
> What are the MIDRs on this SoC? e.g. the output of:
> 
>   cat /sys/devices/system/cpu/cpu*/regs/identification/midr_el1 | sort | uniq
> 
> If this SoC has both Cortex-A78C and Cortex-A55, that's a rather
> unfortunate combination that should have been caught at the SoC design
> phase, as Marc alluded to.

Yes. The MIDR register indicate the same. A78C + A55

root@v8a-arm64:~# cat /sys/devices/system/cpu/cpu*/regs/identification/midr_el1
0x00000000410fd4b2
0x00000000410fd4b2
0x00000000410fd4b2
0x00000000410fd4b2
0x00000000412fd050
0x00000000412fd050
0x00000000412fd050
0x00000000412fd050

> 
> [...]
> 
> > > > This patch [2] from Catalin adds a devicetree property under memory {}
> > > > to disable MTE.
> 
> Catalin's patch was a bit different. It described whether the memory
> range supported tags (and was actually a property of the memory). That
> patch didn't make it into mainline AFAICT.
> 
> [...]
> 
> > I understand that this does not fall under errata but is
> > there a possiblity to introduce an Errata targeting CPU#0 MIDR and
> > disabling the Pointer authentication? I understand that if there is
> > another Qualcomm SoC that exists with all CPUs supporting pointer
> > authentication with same MIDR, we may be disabling the feature but this
> > is something I can check internally.
> 
> I strongly suspect we cannot use the MIDR for this. Per:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=53a52a0ec7680287b170b36488203b5822e6da2d
> 
> ... Qualcomm's Kryo {Prime,Gold,Silver} parts seem to identify
> themselves as Arm ltd implementations, and those will appear in other
> non-Qualcomm SoCs.

Thank you for explaining this. Agree that we can't use MIDR based
workaround here. 
> 
> Without know *exactly* which MIDRs you have on this part, we cannot say.
> 
> Regardless, I strongly suspect that we have to live with the command
> line option for these parts.
> 

Got it. 

Thanks,
Pavan

