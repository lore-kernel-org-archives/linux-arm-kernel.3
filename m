Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B090AC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=; b=VqabqDQza4+Sev
	mlFUIIcb1Fo1hY3YGIU2VnUCmqpGaK/myQPLxWOM5Gf4jsmKzVUXAK7QhF6STf0g6W9ATZaA2DX+w
	kiLoQAiqNzsiAWr4AK324vQ3zSm2xLTt3ENO+Z4KgKr4m/OsJpnwG1tOQe0Q3Cl2z1r94QdkTsOxM
	glvfZyzuJuT9QVJcokSSknh2YjJsHSURi5CXRxT8Oylmn362/oBC2aEPQQbk7FO0eKYy1nhaZ+B3d
	5+kY5Ik+YobvA3T1E81KdTd2ce51Ffe7Jh70Acr2CIWnLuNnDFKStAdqzatLL7zFn2VodBvK1uCst
	OLFJ9ZT+bwxurOJNDnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zor-0000000El1T-3lPx;
	Fri, 18 Sep 2026 14:44:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zop-0000000El0k-01aG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:44:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOtSw101364
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 14:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=; b=Ev
	7OIqCyObUjNIYqgsGclT+aFxz83DUJ5JXZT1YC6XQjxLTh3EEaGOdepPGd12JWPt
	sZhx4jpPGdr+yz3nJlvsx6/AXs0kGN8dhvgOuJnVPciG6jzrsoJWgWWnPhPsIxf6
	3GiYTYXTEMqGC4s8SoIIlq2bZTOOD8HFMPeqkNED+u/EX62sCxUgBWabe5hWda6H
	D5yQZU2fp7T/7D8zGS2ZTco/Dqz5b6+B/Nn00miVFLDHq46FqHcbpzmLl2uA82CZ
	m68Mrfof4f/gOFIrxUyH/q02GBWfffLXvKzCw+6k1RwHJBACJHECKXRIR8CaSl8z
	3WGR4a2+Km/YB2IyJF7Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2kv2mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 14:44:00 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1c1538784so966450eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 07:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789742640; cv=none;
        d=google.com; s=arc-20260327;
        b=UuKtDZ1/Lnko3T0FTvL/IhFK9b3igqvK3ZKsawmWdC38HCoxVNhMywjkmqXMdSNCoD
         QzHl84ysOR1OsHTDGAsN4eY2/boOSBJmB50kE7TUUo37tygBxBdHpylvEA0HQt1flMf8
         H/vASWTmDJSbYrdGO9/iTB5EjHW/du2+H0ex4Me7oJ0qTt/iSB6ZAfGNyEXodYbn1oGZ
         WpWORDLFtM+N++iKRDrZBSZlaW6veOeR0jSJeChUBj68x2mafQJAin8d7rp3b4Q2fOa/
         BTUqpo3lD1objYyq44jmCwi3GrzrX9FaCZXGkLnFjciPysyIhqux9AnsQbuqTlSaIzhc
         D9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        fh=0V7R4j/hF6Xt5FN8rDOudLRSXHaXIEAjR2mWv4nA3yQ=;
        b=eRUYXFFED5ao+CO4MJImUwZVTfIWYe3AUQrX9e7pzBRAmRTZOfnHZD5vlWv1H7pGXv
         VDVs8xzr1awA/Cdh/Xxb5KuJ1xczbkqlpGVyDuMM2or6CffWAAU1WVxPZOlGw5EXf5Lo
         ol6PRFwJgesgLjWiSruubCjLqYCLF14hG12+ZgbWwTp+418H2sOCR2GzJ9cHzi9nmXWF
         78yBTZhntbJRdz5QFtdfx+jg+Fa87VnDFt7KK4C2wyaW6RaOl1ih+A8M8RSfVx3uF/Lt
         O4Ft0nyHDs7F3NVhNtC5gIIF6qIzABaLd3Hp2QQeri5epRH2knBx2p8Y2SGtXT4WLHRW
         ygQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742640; x=1790347440; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=VJTRM9QtPnH7Vhio0dJPl8VSd/lpC/JUtjq2BIbcPPDLD3fBEbGwbyrV8zlTnM5Alp
         Jj3uyLHfYdTjVPs3Strd4eVnbJbU5Cp9QGBQKiaCP7XWGKsm8mHH9/J3X5HH1nhMwE4k
         WJC74EP5aHvuPW9vjz1rKbbjROehLcw9SPwda6B61ZrJkqsaYj5ieYd22tVgnJ5J5BLd
         YP9ZVJT+0oolMoUex+Bi97mzsZbWeYO2+8RGzNeilZ8QRadh/KHmX5ozdp/cIJA6nhqP
         CUO4SqeHqDs4FEbZyi8xtHef36EQW3a2rrPHy7M742ZS5G7L6yJ4/Z5PFRGMeVdhcc4+
         fRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742640; x=1790347440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=kuUQFwGGWkG5fYrTcTTdClseX8WImaGHNaOHDw1axP/+VwQVbl/Zw2WFye/A0DJ9AQ
         UrqCTxuzq40B7DMJR7Wzyzm/oxyEOODUvmAWNvECGtcRUcX4HedPkvcM1Sspa+9+N0KE
         nG3dTE0Ac7ePXR9nLamfpIMMFy1BTdn0UfMgrCkTV7zKuleXDIE+9YKipEzirny8uUBS
         mwV0YF3V/LJ+clLCuAKPgGwN+SfZNrUpUiLzs+PCkYyuaYiGdUucMonG42+oYfEZO2T8
         mR+5aAumgamQ0Q1nfQe3Rzb6sEQD0moHf5qFySfbSlpAFMgpyjp9rQYFEYB7GgjvYx1S
         6E5g==
X-Forwarded-Encrypted: i=1; AKwUvBx7TJv6qIs4AaxqdtiXtkf2zQJgQTdKpNkKSdMj+kE/ciUlZq1j/yH6ebi4/FzdbjH5e3eqbmAotK0XsHcYvEkp@lists.infradead.org
X-Gm-Message-State: AFuF++nV3X9zCJjQtO6XjjNgvtjVeUHtCTu+YxjqaUGrbRnxvN7fDcX/
	FHszMvthM/gQcUBUw5SHT0aWkpSZh3Cw8bRYEmKA58cCC50RWX7pXNfVmaLJbLPY6jiM0JzoR1S
	Mkztk44s+xdTEmNrEzQZxhhpNCVRlr5vHUEF3S3rEjNNZiUtd2DY5JNT6ELKChdfaVuO1iW3wPd
	7KMaD5Uvr4eJ7H1jxm/ClL4MVKyRt+qjsAZd542dKzSXfHbDWwuedl
X-Gm-Gg: AYBFou1GW84uE6ofAeU/nePfRsM4bE1cmRzZrRCeBzliTU3W0BMkIZV2UDuiQJdgZSN
	/scQp5u8BMs1Bk3RrZ3inAn7dDr5vfJVsurfnResCgfkqJ1bgX84EK2m7GLek1RropuxqSd28aM
	BBdlkN6d2Niu0umaFrprSyVS4rKWMZDLPC5EYUSTvHmExPuRhgZ71NutqJ
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id 006d021491bc7-6ca9a74fec8mr2397337eaf.23.1789742639877;
        Fri, 18 Sep 2026 07:43:59 -0700 (PDT)
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id
 006d021491bc7-6ca9a74fec8mr2397308eaf.23.1789742639405; Fri, 18 Sep 2026
 07:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com> <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com> <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:43:47 -0700
X-Gm-Features: AcwNN1XOxS8g7aUV7HRRWF2PBl79h7D0NcKpS9p8imqdtEwjj4hgkc90NvRmmmI
Message-ID: <CACSVV01N8v4kfC0S8YZVUmyOvWcSKX0jFax4_S6vTpbB11X4HA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfXxW8y7KwVCyhP
 Yf9vYcrKj62WS6VIBEmLIoaIsRYf0Q8GoYH/WsRNyfSpAjzFaGvzzbhPBKc5q1SXBk2hdLlWac9
 noW1buZp/s7rfviRcmpKwBNql12rBm77iF6CGAJQuIGxheakLIrSsLweHcHNGBBMa+hx37S3z1j
 3qrQFbe1YGOqgULLkS5eGYTgQTHH/37tCK4rj+wPjMXNH8cbngY8SW/0+he92J2DJyi3Rrcz2Fm
 NRzr7n2LuLU5bmwmMs7jGaurqsqP6DYDQizHKVNBXdf70eBlXZjiV27BL5ETtTFfThKZWtuTQPK
 fjqKdby7c3ZFKHqgM5KZ4JDpmAAfnH+C7+znTNcAFHVZTyahlZK5a/nalOqOSul2n0HpdzXSR3o
 LGpFmGFpnFPJzMjDOFE+r2ElimxQzkKCyw3dtZOC0Th6XLgqro0hltTZIOVTIq/prH7Kye1zg+J
 Ez/VF0Tw3O+31Fc+svw==
X-Proofpoint-GUID: Fjjv-EC5wqq4quhyv0OQGpasO3RzWlGj
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad4e30 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CY0cOUppvrph7IambT4A:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX6TT33tBpPe57
 nkdRVPXXxBN9KUUUMWB4pyov6BcfklkWt4+2A/BxdGUANJgZIKEn3g9sN822defMb82skYUZMy5
 Hcs3KBiCE8JwBkOKbYSKlpbMGWTNpYk=
X-Proofpoint-ORIG-GUID: Fjjv-EC5wqq4quhyv0OQGpasO3RzWlGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_074403_257102_CE4E203D 
X-CRM114-Status: GOOD (  29.94  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 7:10=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
> > On 9/18/26 12:02, Hans de Goede wrote:
> > > Hi Daniel,
> > >
> > > On 18-Sep-26 11:53, Daniel Lezcano wrote:
> > > >
> > > > Hi Hans,
> > > >
> > > > thanks for taking care of that
> > > >
> > > >
> > > > On 9/18/26 11:29, Hans de Goede wrote:
> > > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > >
> > > > > SCMI client drivers already describe their bus match data with
> > > > > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to =
consume
> > > > > SCMI device tables. As a result, SCMI modules do not get generate=
d module
> > > > > aliases from their id tables.
> > > > >
> > > > > Move struct scmi_device_id to mod_devicetable.h so it has a fixed=
 layout
> > > > > visible to modpost, add the corresponding generated offsets and t=
each
> > > > > file2alias to emit scmi:<protocol>:<name> aliases.
> > > > >
> > > > > Use the same stable alias format for SCMI device uevents and sysf=
s
> > > > > modaliases. The previous string included the instance-specific de=
vice
> > > > > name, which is not useful for matching modules.
> > > > >
> > > > > Assisted-by: Codex:GPT-5.5
> > > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > ---
> > > >
> >
> > [ ... ]
> >
> > > > >    #include <linux/bitfield.h>
> > > > > +#include <linux/device-id/scmi.h>
> > > > >    #include <linux/device.h>
> > > > >    #include <linux/notifier.h>
> > > > >    #include <linux/types.h>
> > > > > @@ -951,11 +952,6 @@ struct scmi_device {
> > > > >      #define to_scmi_dev(d) container_of_const(d, struct scmi_dev=
ice, dev)
> > > > >    -struct scmi_device_id {
> > > > > -    u8 protocol_id;
> > > > > -    const char *name;
> > > > > -};
> > > > > -
> > > >
> > > > What is the reason of converting the char * to a fixed array? That =
limits the name and may result in truncation and potentially name collision=
, no ?
> > >
> > > Because of how modpost works to generate modaliases inside the .ko
> > > any string buffers in device_id structs need to have a fixed length.
> > >
> > > So the truncation / name collision issue pretty much applies to all
> > > foo_device_id structs in the kernel. People should now to make sure
> > > that any strings used will fit inside the fixed string. And I would
> > > expect the compiler to warn for overly long strings.
> > Ok, thanks for the clarification
>
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testin=
g
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I'm using v7 on glymur slim7x, and it solves the scmi-cpufreq autoloading

Tested-by: Rob Clark <rob.clark@oss.qualcomm.com>

