Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF14C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfLBfPT4P8YTcQ8clLoZdz2Hz7ChZoOgs/WWhX6OuK8=; b=Zo+WGIsgDRMSpbsLOuVT6KFeEk
	KwE8ehrtWzV0Kx3u6AnZDKgRRGAsYRnxSIt4PTTenlLI+uQbTeq312CGkosfAbhpn3p86msTujIu2
	2K8dFFuPz6s+ElgGqZd90vN8lhDz2+LJ6Mg2mta1zFTuej0AZXLsFFMwL47WEOyx5etIlPeLTzgbT
	3iFhrpD48GRqlzZrWRXAiEqxmy2/6uJuKchtHgw6IqMZVNnhd2IcHl2gCRWPEpnIeeMXAnWtOshXv
	7R/AxpGvDG1+MFP7EekTRQDBg+UmCVG+RoEF/L3UdgGhLq3ijjd9qfx8QksTYzNMSzaxoyFiTOm88
	r9s2Rtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lZZ-00000003T3Y-0bHn;
	Mon, 21 Sep 2026 21:29:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lZV-00000003T30-2PVw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:29:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKfNNl2167487
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfLBfPT4P8YTcQ8clLoZdz2Hz7ChZoOgs/WWhX6OuK8=; b=GTU4lB+BBWko+ahD
	WLILQlwA00dwI4xT3PrluEnAwoU5OMSwBVsgqduNQS8GI01xMCib9CJP2bobH+Oj
	mP84brkPaguPWG49c+1pPUh3ZQSCIdoutRYl+F8niVxgRgADPGHPmt5VNZQr/hEy
	igi/fx/Z/D8GV4qjysVMVj51djoxhHz59ku1okilekdfELtwWt7HLZ22TilBTAql
	xgMq9PlxwPCDJUHXuR1xPe94ZSlF1M0lHk73H2s1PneEI/YH8rgvc11LQ4fr4rN5
	DdOMqE1F5tes5sfkYOtHrV18t0XHWZjP43oExADCb8gkTHqzjQi1rZ5oNLUIWaF7
	bgm4SA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub328anw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:29:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df375fb9b2so26050405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790026147; x=1790630947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SfLBfPT4P8YTcQ8clLoZdz2Hz7ChZoOgs/WWhX6OuK8=;
        b=S7q1c0jJEOlwT9OZEEW0/emHpBIbZMgoMx3bXFf+UkYfm7YVDba9awJzctZcl0rdnX
         RiR11OOYBBu/95LoqkoiCKGinfBC8FDp7WkKI10+avSuMxpv9EBxWAqH/2YT+Xkg088b
         WKKMmlSOb3mrNo6O6FjSMbFnJ55yB6ANTZkqlRgmy4OyGqYuv0UGrvHzrPvpDMbrwB2J
         lsuHEyH3Tk4mPYA4xD/aCtSxAj466NgXMUYXhBQ7iH0OMx4bfaulnd0TvTIF+ngT4ZNa
         BAr21bSNtJrN0UePLuNh3WzBgqnt3oYNRMKdvQ3Z6zAf+0iYRJBXsw/tR3RDg9pjEX74
         QVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026147; x=1790630947;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfLBfPT4P8YTcQ8clLoZdz2Hz7ChZoOgs/WWhX6OuK8=;
        b=CpbW2yySfSKa5O3z31ynYVsyouUiDeTixLk9mz2EWQipEyikrvqsfmhONuBFwtFdER
         bHteqnW3+S/rsbol4hDAmf+8kzIKg1FzkPo7+KH9BPLd9DSLcxkIEhsHWt8EqufWTJps
         otxRtp2i6Hde1ZBcrGHFPgZgIpIPk6n6CGVnUCA4jgLsBgE39hieGj7nfEThF6URlwTU
         OlFhqzME1oTF9zMhdNmu1eI/UTSwm8/tEo9FlSbHJltLIPqnbfBQ3s1q9HBTSEvu3Nh7
         /zLieMJpqRjSG8pwG3Cy585nIt0pHNuhHU8wesJV2syU1EH076ofOGeVa7iDsj/kXaqS
         573A==
X-Forwarded-Encrypted: i=1; AKwUvBwAj4NFP17+ci7Zz8vPhvpFezEWbCTNsw+CoUIuXUE/GLZtUZLXZrwnEwJw7d2+YGcrpH4VQ00Qu/iRp2KPYD2k@lists.infradead.org
X-Gm-Message-State: AFuF++n9dshxzF4wtxA8dalpl8C72hYGByU9nSS7txR07HKyJX/lfN5h
	kJdcAS4I4gGWWhrWiABDMRaauIJLKL1mMrhpUgAt2zZ/uu/4CsGqQiEklgWSbCXyZ/hgrdDieiI
	BKt4cLMPwxEDYGGEhsp44vcwihfwaV8MBrd2NZK5miq6zpvYJjvQm+Pg3D9fWCYQE+ZYqo7P9Gz
	GO8bKUc4noLQ==
X-Gm-Gg: AYBFou3v19LYH77T8r3wBLBcJF3L+LarQeJv6vcUYA8mFISU5hFdr78sDdj6KwTdrhi
	8soYA9X5wNdJi/GDwIlu/rdWGcRxwOEJkJyXolK3IFTeFD8c7pemDIjTbEkEnkMcOwZMIvzemcy
	/w3usoMJQREYwecdj1ufPfeXQmwz8UB4VnxmESmstQePCUfTWQjOalkXtimvwBXP/XdaL+CCEo2
	jDvV5VBtreN8f3mtqMgkJ0g35TDCH/M2sVfodGuOymmJmK5EW/02Dg/iI5R4XApNCOEsvsjDjsN
	6MHKVhdY/s3l2S2yXp98WXAqkNei2WiF1aboB3+mqHV3gt1koRJ75yQ1zimUchSyT6pM7Vy9vdp
	1k1ERYRpgb1iQYoOdn1RLHcIv8w==
X-Received: by 2002:a17:902:e745:b0:2dd:ad73:c98d with SMTP id d9443c01a7336-2ddb1bdefcdmr158852155ad.37.1790026147202;
        Mon, 21 Sep 2026 14:29:07 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:2dd:ad73:c98d with SMTP id d9443c01a7336-2ddb1bdefcdmr158851845ad.37.1790026146755;
        Mon, 21 Sep 2026 14:29:06 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eabe1b9sm780432eec.2.2026.09.21.14.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:29:06 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:29:03 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Message-ID: <20260921142903.000071d7@oss.qualcomm.com>
In-Reply-To: <eb4a30a0-abd2-4334-b5f3-62621ec5a19e@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-2-suzuki.poulose@arm.com>
	<178978126540.2352296.16845657485139032765.b4-review@b4>
	<d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com>
	<eb4a30a0-abd2-4334-b5f3-62621ec5a19e@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab1a1a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=ZpRu-6ZVBUCh-PS3OmgA:9 a=wPNLvfGTeEIA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: unnY3NAISQNxfaAV8drMn9wnk8Ycq_Cl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxMyBTYWx0ZWRfX4NfxRrlo8D8f
 7dBSUURBPtN6C0ANrK7n1KAhJiZ+8B3a6r2+BLsRdkdwsQ2W/wDOO07RHpglnksV0DNsAVZq1Kz
 SAudT3mj/sKySDBIzvEoT2urzOE/HGuM+tAJLXGhcMypSArLWDMOH6VR0Mekf7rn5eLPHS2vKG2
 CtSHytSU4bx8VX2g7aV9uZuZNjBEKbxIng7mdEKZZrp/Y4/vSo7CkQz54iOo4W1HgVQU/s/fHrd
 h5QE4YujQSmh3qp+t1MrVOJ9X9XOk7xZOktqyKw4Q7NU0LeC4z6gZl52kSBHMjtH2MWU0rkw46y
 ByUetJVmanBP1zDjMH4HNH2bjun6uR4Y6fJDqEX5dwA7txqSjW2jHOyJrw92QhdXs8SreD1A0OH
 Xrx3VDtA1UOyQ3KrmjifXCC6WXAdjUohoQkeze05j9Pey58ifGl+QdOsNGJiGCa8dMRhQVR6gyS
 xe9QOm87dme5La72hDg==
X-Proofpoint-GUID: unnY3NAISQNxfaAV8drMn9wnk8Ycq_Cl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxMyBTYWx0ZWRfXyyBsEQ08IKlW
 T12UL9nXFhnzdUn5Rco33cyZmgxM6a2YfOc9k0jldK2jKZ9l/ugIh59DrK7vdTcR/vrzdENuWlk
 Bd7JfEcirNBFLTXD1Rp0uEQFV4TMdUQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_142909_743331_D9C781DA 
X-CRM114-Status: GOOD (  25.65  )
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

On Mon, 21 Sep 2026 11:14:22 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 21/09/2026 10:27, Suzuki K Poulose wrote:
> > On 19/09/2026 02:27, Jonathan Cameron wrote: =20
> >>> The RMM (Realm Management Monitor) provides functionality that can be
> >>> accessed by SMC calls from the host.
> >>>
> >>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
> >>>
> >>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
> >>>
> >>> Signed-off-by: Steven Price <steven.price@arm.com>
> >>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com> =20
> >>
> >> With Gavin's nitpicks and the GENMASK_ULL() from sashiko, just a few
> >> comments inline.=A0 Mostly on subtle inconsistencies that really don't
> >> matter that much.
> >> =20
> >>> =A0 include/linux/arm-smccc-rmi.h | 497 +++++++++++++++++++++++++++++=
+++++
> >>> =A0 1 file changed, 497 insertions(+)
> >>> =A0 create mode 100644 include/linux/arm-smccc-rmi.h
> >>>
> >>> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc-=
=20
> >>> rmi.h
> >>> new file mode 100644
> >>> index 000000000000..214d6228dfc2
> >>> --- /dev/null
> >>> +++ b/include/linux/arm-smccc-rmi.h =20
>=20
> ..
>=20
> >>> +
> >>> +struct rec_exit {
> >>> +=A0=A0=A0 union { /* 0x000 */
> >>> +=A0=A0=A0=A0=A0=A0=A0 u8 exit_reason;
> >>> +=A0=A0=A0=A0=A0=A0=A0 u8 padding0[0x100]; =20
>=20
> ...
>=20
> >> =20
> >>> +=A0=A0=A0 };
> >>> +=A0=A0=A0 union { /* 0x400 */
> >>> +=A0=A0=A0=A0=A0=A0=A0 struct {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntp_ctl;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntp_cval;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntv_ctl;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 cntv_cval;
> >>> +=A0=A0=A0=A0=A0=A0=A0 };
> >>> +=A0=A0=A0=A0=A0=A0=A0 u8 padding4[0x100];
> >>> +=A0=A0=A0 };
> >>> +=A0=A0=A0 union { /* 0x500 */
> >>> +=A0=A0=A0=A0=A0=A0=A0 struct {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 ripas_base;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 ripas_top;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u8 ripas_value;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u8 padding5[0xf]; =20
> >>
> >> In various other places you just use a u64 for a u8
> >> + padding. Why is this one special? And for that matter
> >> various other fields later in this particular structure? =20
> >=20
> > Please feel free to point out, if you spot any. I am happy
> > to fix them. =20
>=20
> I took a look and the padding is for extra "u64" bits in there.
> e.g, ripas_value offset =3D 0x510 and the s2ap_base is really at 0x520
> not 0x518. Same applies for the pmu_ovf_status and vsmmu.
>=20
> So, I would leave them as they are. The rest are consistent.
> e.g, num_bps and num_wps. in realm_parameter
Ok. That's logical enough for me.  When no padding happens to follow
that goes beyond the u64 then use that for simplicity and if there
is padding anyway use a u8[] that include the rest of the u64 and
the next bit

Thanks for talking me through it!

Jonathan
>=20
> Cheers
> Suzuki
>=20
>=20
> > =20


