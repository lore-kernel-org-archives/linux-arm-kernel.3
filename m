Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A47CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=; b=sDFV6C41iXI51s00c8JE2+FnoU
	mbR5VDkuu9HzXkrWSL10HS86VjzWD3ruQEDRf+ZRECRQcLaYKiclgOsOJs8QJGlcQkjkPLi3EHi2e
	qAkMJWd+zoA0p5dnynkRKrNd9KpL6/IbM5giY71GO+De8l8z653IAeJryU7ZcbnF04fGK875cAsoh
	v9EQNKB3FgNtxE2dYTqdI+V3Q+Lj+OXGOOGfMm5eX5XDt+FGZsYJ09GNFiqSQknL0VgQbCR5qb5ZU
	IxnZghnHTlQArPaPl5wIfDMlk6yxPJ5CiJ7KFOkbfikzdy4CvVQNcrft3qYQ0eYtIJcmftVd6Hblj
	1GVOOBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaPO-0000000417L-19oj;
	Tue, 29 Sep 2026 16:10:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaPK-0000000416M-026L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:10:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE6AOa1649751
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 16:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=; b=QmJ/TaNbDw+ozn+u
	9yy6hwUNlhl3CuoQ9RpIiupjF2ujDaTV3C/H7E7HAOGbiYXv/kmRExf9S61Tkfxu
	QrRmCiDQ+TFmaZNNgO/wjzrm/LLmNR9YXFWR0rX6UcwYd62VLLyyuWSXco0rFfbw
	zhuTXhw5rLjACGxdrSByOdJa+hg1e4Cdr+nBIGqeVutomoVGRnDEqWt4EM36UdQ7
	oZ35NNbP0Xg03yUqk1UkdXpvkXDKnLJX2/H8+cVTX2JGBLVRxkky3uwIUjSOQGbj
	Eo7Q9+5xBgIc25meQjENE6wkr/9ToMtugDaKGRAD1QxSp0G9Y8YlSGcO81fs6Hm2
	T63uww==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et28k4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 16:10:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so14908c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790698217; x=1791303017; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=;
        b=eE12dwlgWoplqRh2vpG2ydn2GHCFo2mdHBA7QBmn+favu9BbxBq4VEFLAs8yzYZfco
         By/doS8tL66RauDqwjChgVrvK3bsYR+rJ4P9OK84ztIibEgcUvJaCkXQNkxV7g5+GEv/
         pcANuA/2crDmAarNtFG3UrWN5kxVIbeYYab8Jg0Rxpd1p7UicCzxQEL4KC98tHd2kk+3
         I3hs/l/T5xacWamn+MU3YAA88NPkBkR4cJF4c8GH9v+uwqrFtiM/Lhsq4YghB9GpHZF4
         Ps1kz2RyRGdr00L7CSq9Gu6om65uqDgYgdEBRYhBJW6Bv4ecFCSkerhbZWy0wzFxX+6t
         l1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698217; x=1791303017;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=;
        b=s0MotCi1PmR4h3cSzebMho+fSkEYXuA/mqeTMWpmS+hZCblqUjGV4wWCeCSgP9idky
         KilSpvtIPQXAOjp7Z63zY0WGR54d5hvY9bR8Jf9uCcXuI7UKEKGgdCpAyStnb6TrVMMB
         JApliaC7vEjx7r8f7ZYpOxfvzx2a/9JJBfjxOm8OKIwCJTIi0CONJBww3YHRPMAqAirB
         7NbNbzJRrsthzra/fTwfFdxQbgi8wwo3egAzlPkS2/S3fxXoBpSZUSUSwuXz9jS8qMm4
         vnAFVvAS+VGlp+Zrhgz2826Av5+IVNp2P9O9OnkQf974V/D10AaUL/4GqEJ6K/hB+E13
         9Q5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzytO8yRl50Link4ImZ83JWv5vQLPpGz0XUmwVjoocMh3HtXBmGHlNiANWZiB1WNj6o5r/Ma2LxQNLeIakMnFCP@lists.infradead.org
X-Gm-Message-State: AFuF++nlFkfUtjEuORLjZvSgVOL7CdrY4VHmgHRU4RlyeguoBZxzw+Fq
	fzV9aVMz6JkovdoOFZhoNNl34fFlgxV9Y3sU0KogCR/dWMSaeG1ID/b/5UPv6xItWlsdoqz3bgW
	jQC/Qr2DQK02jDSM747CyiCiTizq4bcpxR06HEicKQoK0yYtH6wI8U1z+RDLATjNjtVs73IXTBG
	IIKQ==
X-Gm-Gg: AYBFou3AgLfBNJfTuHe7DF4UXD15Zco1kWEgf7PDCp3RmY3Zq5CK50kG9W31cRr12dM
	8OBOqXvx4txhbKtxXNELamAgUWrQISrPaSokoQxI7P/O9hDam6vI4Eg4dRRgOj2J9yHULeBWO45
	ZaRoHEOrW5oVF866ZbRc/aPObrjBKS4GLHF4xLCw8bpWhy9LPcJFsGEuyvRhYEvmWsL/HkVDs8Z
	ERRFvoWhZseYXQW88D50LPGGnS4OV5BX3/UWBdVUXwcqbE+EgJub69q4VmsXa+84SGmOFmbE4Fh
	8gNDf5JJ2+TqUJ5L3Y8Nh2bq0ZHJOaezfUBbbUuXX9cuXrIEVzaeyNycd9gncY+IAge8T/y7UpU
	5se5CvWn0PPHCmZyJfZW3FjgYLt7sDIfw8hqrsJnIlxx6BZgL3KI/ogU=
X-Received: by 2002:a05:7022:7f1c:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-149cfa49d51mr7719483c88.3.1790698216593;
        Tue, 29 Sep 2026 09:10:16 -0700 (PDT)
X-Received: by 2002:a05:7022:7f1c:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-149cfa49d51mr7719451c88.3.1790698216013;
        Tue, 29 Sep 2026 09:10:16 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c6489457asm350724c88.15.2026.09.29.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:10:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:10:11 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry
 support
Message-ID: <20260929091011.000076d2@oss.qualcomm.com>
In-Reply-To: <20260928130134.000019ff@oss.qualcomm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
	<20260920091928.2014972-7-cristian.marussi@arm.com>
	<20260928130134.000019ff@oss.qualcomm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CH3ftUCLm03te8GDJUFk_0z8ddryTyoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX+NAWqkaHSzlu
 vk5P37e+r42hIUReA1n2jGFHs8SuMRFPagpfqBY1H8Bb3DjXCGxjw1PzGOFXdjFa8rF25LBCnrz
 pi42LsbY0+5zeJNBvYfi3okYzco0zpi1IwsJXvsI7tZFxsPSlZnSKyyE/fOikj1zFThk+M7eySh
 tJg6JyDWidDwOBlMTGK+1VoglIvPPBYuVTSCDT+RfgGubKTst0Lw9zDGK9sAqzkDpGKiCwpyTpW
 rWreWZ8RDuBqJcHwgVDPuG9TOI3IVFNWvjX0a7TQ2Fs6xN5Avf82QOejFVDuggGiUt3LerrRWCB
 7nwha7QsepGeEFWjR4WL7ciCVOv3Sr0tHatij7jWuiJjdOLMhjDQqGkap0GOSZNY7b+MKpQW/Qa
 jzSGBR2F1MrButKC2qbV4nyusQBgyE/jZJUAbTEebbrmZO1rPX1dkg04Cle04JAIiDU5/bKU/fB
 9Wc8ewaFRTaTDavcduw==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abbe2e9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Usant2sCTZzwgyS8W3EA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: CH3ftUCLm03te8GDJUFk_0z8ddryTyoK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX3OiCzMogLBdL
 DSMUG6Y7RwM+fowqpGTtUEZwBvAaygqBEtvLoGj6WJ5WLDTcFwNORQGA2T6wwvQ+R5E1mDvqBqO
 HweZFxwwTUY2LlVefUyt8WNhDdF513g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_091018_057215_863170EB 
X-CRM114-Status: GOOD (  19.43  )
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


> 
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index 5ab73b1ab9aa..2850b018da0d 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h  
> 
> > +
> > +enum scmi_telemetry_compo_type {  
> 
> I'd add some breadcrumb comments to help people find the sources
> of these.  My personal preference for enums of things with spec
> defined values is to also set every value explicitly.  Makes
> it a lot easier to check individual values are right.
> 
> Note that there are quite a few more entries here than I'm seeing
> in DEN0056F so I'm guessing there is a draft version that isn't public
> yet (and I'm too lazy to see if I can get via other routes :)
Ignore this one.   Somehow I didn't notice two columns, though I will say
that is an ugly style in one table!
> 
> > +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> > +	SCMI_TLM_COMPO_TYPE_CPU,
> > +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> > +	SCMI_TLM_COMPO_TYPE_GPU,
> > +	SCMI_TLM_COMPO_TYPE_NPU,
> > +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> > +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_IPU,
> > +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> > +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> > +	SCMI_TLM_COMPO_TYPE_SOC,
> > +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> > +	SCMI_TLM_COMPO_TYPE_SMCU,
> > +	SCMI_TLM_COMPO_TYPE_ACCEL,
> > +	SCMI_TLM_COMPO_TYPE_BATTERY,
> > +	SCMI_TLM_COMPO_TYPE_CHARGER,
> > +	SCMI_TLM_COMPO_TYPE_PMIC,
> > +	SCMI_TLM_COMPO_TYPE_BOARD,
> > +	SCMI_TLM_COMPO_TYPE_MEMORY,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> > +	SCMI_TLM_COMPO_TYPE_LID,
> > +	SCMI_TLM_COMPO_TYPE_DISPLAY,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> > +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> > +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> > +};

