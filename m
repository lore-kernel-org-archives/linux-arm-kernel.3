Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546CCC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9pxl/iJkyBgboMkMU0XQvop1HQv8Kn/K5jHiJ7u9YU=; b=fL8sXMkbSkuA0n6FvxYB81LurE
	In/6aOcsJhZKpo8TuxrkC7smziDDj36hNoqFNTw73SpaH3zXPrExGX6KLXcnR2yIzYovgFM/Mvypu
	67oUoDUCslaFr95bSsl+ABDY9wA97HSyDPwK3OtRh3Dhv3/thMLQ9TeFEUZaDKbiFVOUFmze5ptud
	AV+wTXmXaTCx6xz2VhViZ9DcMWr2EqohEhgHdGind1mxuVe6FSYxxO72yB71zkq3ClQdBynAGZRxG
	nbB5xkbBK2X6W2LiNczj7V8fXavHuiBzF3o2Up9ohGFh/IEwwVjrFQSQ77Z8rvtBuTFy9zzTT33Nv
	vAt+1x0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21s8-0000000GZcL-42aC;
	Thu, 03 Sep 2026 07:28:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21s6-0000000GZbX-0XJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:28:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lLBu3113944
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 07:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9pxl/iJkyBgboMkMU0XQvop1HQv8Kn/K5jHiJ7u9YU=; b=ofZIP/4Znjwy/qU4
	/FmWem59SrLe0az1WRVFIDdllQxMZChSiLdGdHntL4lsj9EkPEy+Ud+Vcx3HQLms
	T/LvoIt+xdij2qOE6+AD2UB68pSIiY4jUA9WxqcjP4mZmBE9cMNZNRL12wOf6keg
	yC1HeFuEl/I2wU+7K6/mxsRlokaK+kkoCZZYWDPMYXW0AMWqkHM47abKbUXQWwGp
	Zxe4/AESbQ6HuP0t8lSwGe3gnz5Z3SNhatBDV+Ja+vft+krAeJzD522h5k8iL37t
	NiJdy+Umm2AgPl5UluaJHsnOwJuFq4GHipVKXZGhlzFR2o+0PgZ1YUZ1xjPc+DgP
	CXif9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjrwpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 07:28:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2537695a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788420508; x=1789025308; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9pxl/iJkyBgboMkMU0XQvop1HQv8Kn/K5jHiJ7u9YU=;
        b=L2LqV8VI02zSc0sxz37UF8onZ2B+nJBNdXjEG2eKdMG08+NinN3VDaaJmo1R/ERY9h
         t3FaX2nbkqO41EF4QtwQBStk9nWnsulSmN6stjXQCK3M0frheWBUaydbGPvrdq0egnzN
         fz855DG33ecY/1hBW3TNcvC4Pw7pF1FBlpnejxwuSejL/12v63qWripLcH6K0Sr76tTu
         gTBpDX/N1x2i2DbV4pTO632E/Y3rhrhDfoZNuJ5MNgNIFrjW181D+XmEaPgXZfa1sIV4
         xnO75makInh29LY879ZJlSZdfVUpg4GLvGdLWqUXrBKFFiqoQ25KbMKsdAjs4oTWw1Jx
         mtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420508; x=1789025308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9pxl/iJkyBgboMkMU0XQvop1HQv8Kn/K5jHiJ7u9YU=;
        b=eV6Y9J2NqLlovBsDF1LLor7v8NBRNelMk7z9ND2DIX0GGT9XKu+q8Ishc2c27/9azZ
         YGDGAftOgBrcEpgQcS5txEaqquBhPbkgb32HUIXJKbQBOpDOC9l/fAzYCZWc1U2Il51+
         JvneNgFXuL/ifOzghuKzWF6OrvH2AqC5vDgk78pNUIWU28DlxpLr1kMWR32MhYdOBjV4
         qkGBst6XLzu6K3nZLy4+B4pdYK6AyQq70wa2VPQS071xRrbDrn7c88P/PZ6Yt5ywAsSR
         aWfylooq0G32bycEpmD+rjEdPI8de6uJsz/MYSzzjiQTKkEDBUwg5yOHWrZJSqbWjppG
         Y6Lw==
X-Forwarded-Encrypted: i=1; AKwUvBy62TmqrLS8olJNYobVKidCbHt1b2JAotmXR06L+rEf/8rFu0hoP1O6Ta34C2DHZnRbQEG6q2Pq1XijnIT46rjB@lists.infradead.org
X-Gm-Message-State: AFuF++mqSc/jcnpAMBetS/Czw2nlvQgmR4ZSCzodg6avgnWZYeDPUC2I
	R8VUwn6uKOVLN5lUh5PFb9YaedldgI5xL+E5EXPt+BKh2TwbzBcBsiFCpnmwWFhKPYdSe8943Y+
	GiDR3vGPgZ3FPR6OW3vdmbTXIX/5J/SMta09cnPWinlHs8T91olCwY4CXRvFUv3cwmzbihb3WGE
	lSPg==
X-Gm-Gg: AYBFou3iaZ4clErac2bDC+GzTGDX2fBCYaTpwIVkoEMWOyIEF3xKYgdDqn8IlVPPLPY
	oDRsxlGNWGZOsZyzUMKvzMbk3bX+gX3XoehSK4lRudZn7iTuCmeTmg++IxiFO0lHt3w2XQVewty
	jd/gAx1a7vVUlooX4WM6vrcE8OyFRi+YCMZ7gVIEUwpUBZCnMUNvJXe6+k8Kaj9e/f2v4T/TOiY
	1NNR2ur0dnBx1ZTPY+fzCgUNC4jVKeT9FYTOBvf89HRMMbdDJNplIvij84BmfK3k1D7a7kyMWJO
	WLqRptrvGfQbxGW7sKiCKDN0LBviTEKByi085L+F9uG6Fw5zvKKgAWnSy6fQrY0DMzg9JVOZKgo
	5INj9/KDFkD02mgQp2VuV
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr14792423a91.12.1788420508089;
        Thu, 03 Sep 2026 00:28:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr14792364a91.12.1788420507560;
        Thu, 03 Sep 2026 00:28:27 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm3990262a91.14.2026.09.03.00.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:28:26 -0700 (PDT)
Message-ID: <336022b2-048d-4523-b97c-2a08d6b185f1@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:28:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] fix clock refcount imbalance for all Coresight
 platform drivers
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX0WoMxHsw7SPy
 Mfrfyov8+iDc7fl4VWjrheXo2EIkrGHA09C6YhOeNQqFsmGmVaLHowjdxLMDom4HKDgSrMqKT//
 dHEhZw7+pAQEWhSlfVMuX1cqhxIXrHAgoKVs/lsINmVzRx3nOeETtpgSVIxCRJldDRZBOEM0+Ij
 5AuRN0VbpDGV7L3N+J4dYFxblbBin6vJ7N0yFbqSJ7NMHlAAVCNgvdg48RVyzFW4YQi1bDAPQ/F
 zfGbA63tFAFluuBqmsgSaoyC1iIER6KIPWeDxwn2QwWoHtmImYaE5PLp86M5GRVoapIBoMzIIvk
 9ks/QytxaDfMZJIKWYP/FpecvTFDVS9g/3n2e/ezUNKxWEuhKU+5LKUb2FHwHsupEihTmQH+tAi
 r46ATVuvSzVqbN3VHOU3/FcmkqSABwaGYOYQ8ZRP2nSWJnEbwpOUeaZmwYGd9gikeaPF1DBrfT5
 BTH33BrOezshcGMs1uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX4TVHjR0hYJMI
 TpL134CW4k9C39N3F6reoclSy8YQk+6mqZ3tSAI5Twzt/OgOyhgsWQheehivLD/08mF5457jGf1
 IEkfIcTA5z0J7Tn4pCBPvMKM4Y4OeVo=
X-Proofpoint-GUID: l7ceaCeOvvYS0E-J-AF-6s1yGzCe6nBk
X-Proofpoint-ORIG-GUID: l7ceaCeOvvYS0E-J-AF-6s1yGzCe6nBk
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99219c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iLbzAW0jkWTVcrWTFk4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_002830_253804_30D2F738 
X-CRM114-Status: GOOD (  22.11  )
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

DQoNCk9uIDcvMTAvMjAyNiA5OjE0IEFNLCBKaWUgR2FuIHdyb3RlOg0KPiBGb3VuZCBhIGNs
b2NrIGltYmFsYW5jZSBpc3N1ZSB3aGVuIHJlbW92ZSB0aGUgQ1RDVSBtb2R1bGUuDQo+IA0K
PiBjb3Jlc2lnaHRfZ2V0X2VuYWJsZV9jbG9ja3MoKSBlbmFibGVzIHRoZSBwcm9ncmFtbWlu
ZyBjbG9jayBhbmQgdGhlDQo+IG9wdGlvbmFsIEFUIGNsb2NrIHRocm91Z2ggZGV2bV9jbGtf
Z2V0X29wdGlvbmFsX2VuYWJsZWQoKSwgd2hpY2ggYWxzbw0KPiByZWdpc3RlcnMgYSBkZXZt
IGFjdGlvbiB0byBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIHdoZW4gdGhlIGRyaXZl
cg0KPiBkZXRhY2hlcy4NCj4gDQoNCkdlbnRsZSByZW1pbmRlci4NCg0KPiBBZnRlciBwcm9i
ZSwgcG1fcnVudGltZV9wdXQoKSBhbGxvd3MgdGhlIGRldmljZSB0byBzdXNwZW5kIGFuZCB0
aGUNCj4gcnVudGltZSBzdXNwZW5kIGNhbGxiYWNrIGRpc2FibGVzIHRoZSBzYW1lIGNsb2Nr
cy4gRHVyaW5nIHJlbW92ZSB0aGUNCj4gZGV2aWNlIGlzIGxlZnQgcnVudGltZSBzdXNwZW5k
ZWQsIHNvIHBtX3J1bnRpbWVfZGlzYWJsZSgpIGZyZWV6ZXMgaXQNCj4gd2l0aCB0aGUgY2xv
Y2tzIGFscmVhZHkgZGlzYWJsZWQuIFRoZSBkZXZtIGNsZWFudXAgdGhhdCBydW5zIGFmdGVy
d2FyZHMNCj4gY2FsbHMgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgYSBzZWNvbmQgdGltZSwg
dW5kZXJmbG93aW5nIHRoZSBjbG9jaw0KPiBlbmFibGUgcmVmY291bnQuDQo+IA0KPiBSZXN1
bWUgdGhlIGRldmljZSB3aXRoIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBiZWZvcmUgdGVhcmlu
ZyBpdCBkb3duIHNvDQo+IHRoZSBjbG9ja3MgYXJlIGVuYWJsZWQgYWdhaW4gYW5kIGJhbGFu
Y2UgdGhlIGRldm0tbWFuYWdlZCBkaXNhYmxlLiBUaGVuDQo+IHBtX3J1bnRpbWVfc2V0X3N1
c3BlbmRlZCgpIGFuZCBwbV9ydW50aW1lX3B1dF9ub2lkbGUoKSBsZWF2ZSB0aGUgZGV2aWNl
DQo+IGluIGEgY29oZXJlbnQgcnVudGltZSBQTSBzdGF0ZSAoc3VzcGVuZGVkLCB1c2FnZSBj
b3VudCBiYWxhbmNlZCkgb25jZQ0KPiB0aGUgZGV2bSBhY3Rpb24gaGFzIGRpc2FibGVkIHRo
ZSBjbG9ja3MuDQo+IA0KPiBDYWxsdHJhY2U6DQo+IA0KPiBbICAxOTQuMDc0MDE1XSAtLS0t
LS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gWyAgMTk0LjA3ODc3OV0gcWRz
cyBhbHJlYWR5IGRpc2FibGVkDQo+IFsgIDE5NC4wODIyMTBdIFdBUk5JTkc6IGRyaXZlcnMv
Y2xrL2Nsay5jOjExODggYXQgY2xrX2NvcmVfZGlzYWJsZSsweDIzOC8weDI0MCwgQ1BVIzQ6
IHJtbW9kLzUwOA0KPiBbICAxOTQuMDkwOTc2XSBNb2R1bGVzIGxpbmtlZCBpbjogY29yZXNp
Z2h0X2N0Y3UoLSkgc25kX3NvY19oZG1pX2NvZGVjIHNuZF9zb2NfY29yZSBzbmRfY29tcHJl
c3Mgc25kX3BjbV9kbWFlbmdpbmUgc25kX3BjbSBzbmRfdGltZXIgc25kIHNvdW5kY29yZSA4
MDIxcSBnYXJwIG1ycCBwaHlfcWNvbV9lZHAgc3RwIGFmX2FsZyBsbGMgYW54NzYyNSB0eXBl
YyBwY2lfcHdyY3RybF9wd3JzZXEgaGNpX3VhcnQgcWNvbV9pcmlzIHY0bDJfbWVtMm1lbSBi
dHFjYSBidGJjbSBxY29tX3BvbiB2aWRlb2J1ZjJfZG1hX2NvbnRpZyBydGNfcG04eHh4IG52
bWVtX3Fjb21fc3BtaV9zZGFtIHFjb21fc3BtaV90ZW1wX2FsYXJtIHZpZGVvYnVmMl9tZW1v
cHMgcXJ0ciB2aWRlb2J1ZjJfdjRsMiBibHVldG9vdGggbXNtIHFjb21fc3RhdHMgcHdyc2Vx
X3Fjb21fd2NuIHVid2NfY29uZmlnIHZpZGVvZGV2IG9jbWVtIGVjZGhfZ2VuZXJpYyBkcm1f
Z3B1dm0gdmlkZW9idWYyX2NvbW1vbiBkcm1fZXhlYyBncHVfc2NoZWQgcWNvbV9xNnY1X3Bh
cyBrcHAgbWFydmVsbCB2aWRlb2NjX3NhODc3NXAgY2FtY2Nfc2E4Nzc1cCBlY2MgZHJtX2Rw
X2F1eF9idXMgZGlzcGNjMF9zYTg3NzVwIHNwaV9nZW5pX3Fjb20gaTJjX3Fjb21fZ2VuaSBs
bGNjX3Fjb20gbWMgcWNvbV9yZWZnZW5fcmVndWxhdG9yIHBoeV9xY29tX3NucHNfZmVtdG9f
djIgcGh5X3Fjb21fcW1wX3VzYiBpY2NfYndtb24gcGh5X3Fjb21fc2dtaWlfZXRoIGR3bWFj
X3Fjb21fZXRocW9zIHFjb21fcGlsX2luZm8gZ3B1Y2Nfc2E4Nzc1cCBxY29tX3E2djUgc3Rt
bWFjX3BsYXRmb3JtIHN0bW1hYyB1ZnNfcWNvbSBxY29tX3N5c21vbiBkcm1fZGlzcGxheV9o
ZWxwZXIgcWNvbV9jb21tb24gcGNzX3hwY3MgcGh5bGluayBjZWMgcWNvbV9nbGlua19zbWVt
IHFjcnlwdG8gZHJtX2NsaWVudF9saWIgbWR0X2xvYWRlciBkaXNwY2MxX3NhODc3NXAgcW1p
X2hlbHBlcnMgcGh5X3Fjb21fcW1wX3VmcyBsaWJkZXMgcWNvbV9pY2UgZGlzcGxheV9jb25u
ZWN0b3IgcGh5X3Fjb21fcW1wX3BjaWUNCj4gWyAgMTk0LjA5MTEzMF0gIHFjb21fd2R0IHFj
b210ZWUgbnZtZW1fcmVib290X21vZGUgaWNjX29zbV9sMyBxY29tX3JuZyBkcm1fa21zX2hl
bHBlciBjZmc4MDIxMSByZmtpbGwgc29jaW5mbyBmdXNlIGRybSBiYWNrbGlnaHQgc3RtX3Bf
YmFzaWMNCj4gWyAgMTk0LjE5NjEyNF0gQ1BVOiA0IFVJRDogMCBQSUQ6IDUwOCBDb21tOiBy
bW1vZCBOb3QgdGFpbnRlZCA3LjEuMC1uZXh0LTIwMjYwNjIzLTAwMDA4LWdhNDY3MTMyOGJh
MzYgIzgzMSBQUkVFTVBUDQo+IFsgIDE5NC4yMDY1NjZdIEhhcmR3YXJlIG5hbWU6IFF1YWxj
b21tIFNBODc3NVAgUmlkZSAoRFQpDQo+IFsgIDE5NC4yMTE3NzFdIHBzdGF0ZTogNjA0MDAw
YzUgKG5aQ3YgZGFJRiArUEFOIC1VQU8gLVRDTyAtRElUIC1TU0JTIEJUWVBFPS0tKQ0KPiBb
ICAxOTQuMjE4OTM4XSBwYyA6IGNsa19jb3JlX2Rpc2FibGUrMHgyMzgvMHgyNDANCj4gWyAg
MTk0LjIyMzQyNl0gbHIgOiBjbGtfY29yZV9kaXNhYmxlKzB4MjM4LzB4MjQwDQo+IFsgIDE5
NC4yMjc5MDhdIHNwIDogZmZmZjgwMDA4ODlmYmI0MA0KPiBbICAxOTQuMjMxMzI3XSB4Mjk6
IGZmZmY4MDAwODg5ZmJiNDAgeDI4OiBmZmZmMDAwMDk3MmViNTgwIHgyNzogMDAwMDAwMDAw
MDAwMDAwMA0KPiBbICAxOTQuMjM4NjYyXSB4MjY6IDAwMDAwMDAwMDAwMDAwMDAgeDI1OiAw
MDAwMDAwMDAwMDAwMDAwIHgyNDogMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAxOTQuMjQ1OTk1
XSB4MjM6IGZmZmZkMTgxZDNkZTQ2MjAgeDIyOiBmZmZmODAwMDg4OWZiYzI4IHgyMTogZmZm
ZjAwMDA4MjM4MjgxMA0KPiBbICAxOTQuMjUzMzIyXSB4MjA6IGZmZmYwMDAwODIzMzRhMDAg
eDE5OiBmZmZmMDAwMDgyMzM0YTAwIHgxODogMDAwMDAwMDAwMDAwMDAwNg0KPiBbICAxOTQu
MjYwNjU4XSB4MTc6IGZmZmZkMTgxZDI5M2ZiMTggeDE2OiBmZmZmZDE4MWQyOTVjM2M4IHgx
NTogZmZmZjgwMDA4ODlmYjU1MA0KPiBbICAxOTQuMjY3OTkxXSB4MTQ6IDAwMDAwMDAwMDAw
MDAwMDAgeDEzOiBmZmZmZDE4MWQ0ZWVhNjIwIHgxMjogMDAwMDAwMDAwMDAwMDRjZg0KPiBb
ICAxOTQuMjc1MzQ2XSB4MTE6IDAwMDAwMDAwMDAwMDBlNmQgeDEwOiBmZmZmZDE4MWQ0ZjQy
NjIwIHg5IDogZmZmZmQxODFkNGVlYTYyMA0KPiBbICAxOTQuMjgyNjc2XSB4OCA6IDNmZmZm
ZmZmZmZmZmVmZmYgeDcgOiBmZmZmZDE4MWQ0ZjQyNjIwIHg2IDogYmZmZmZmZmZmZmZmZjAw
MA0KPiBbICAxOTQuMjkwMDA3XSB4NSA6IGZmZmYwMDBlYWQ5NzQyNDggeDQgOiAwMDAwMDAw
MDAwMDAwMDAwIHgzIDogZmZmZjJlOGNkOTYxMTAwMA0KPiBbICAxOTQuMjk3MzM4XSB4MiA6
IDAwMDAwMDAwMDAwMDAwMDAgeDEgOiAwMDAwMDAwMDAwMDAwMDAwIHgwIDogZmZmZjAwMDA5
NzJlYjU4MA0KPiBbICAxOTQuMzA0NjcxXSBDYWxsIHRyYWNlOg0KPiBbICAxOTQuMzA3MTk5
XSAgY2xrX2NvcmVfZGlzYWJsZSsweDIzOC8weDI0MCAoUCkNCj4gWyAgMTk0LjMxMTY4N10g
IGNsa19kaXNhYmxlKzB4MzAvMHg0Yw0KPiBbICAxOTQuMzE1MTkyXSAgY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKzB4MTgvMHgzMA0KPiBbICAxOTQuMzE5NTk2XSAgZGV2bV9jbGtfcmVsZWFz
ZSsweDI0LzB4M2MNCj4gWyAgMTk0LjMyMzU3OF0gIGRyX25vZGVfcmVsZWFzZSsweDFjLzB4
MjgNCj4gWyAgMTk0LjMyNzQ2Nl0gIHJlbGVhc2Vfbm9kZXMrMHg1Yy8weDkwDQo+IFsgIDE5
NC4zMzExNDddICBkZXZyZXNfcmVsZWFzZV9hbGwrMHg5MC8weDEwNA0KPiBbICAxOTQuMzM1
MzY0XSAgZGV2aWNlX3VuYmluZF9jbGVhbnVwKzB4MmMvMHg4NA0KPiBbICAxOTQuMzM5NzYy
XSAgZGV2aWNlX3JlbGVhc2VfZHJpdmVyX2ludGVybmFsKzB4MjAwLzB4MjNjDQo+IFsgIDE5
NC4zNDUxNTNdICBkcml2ZXJfZGV0YWNoKzB4NGMvMHg5NA0KPiBbICAxOTQuMzQ4ODM1XSAg
YnVzX3JlbW92ZV9kcml2ZXIrMHg2Yy8weGJjDQo+IFsgIDE5NC4zNTI4NzJdICBkcml2ZXJf
dW5yZWdpc3RlcisweDMwLzB4NjANCj4gWyAgMTk0LjM1NjkxNF0gIHBsYXRmb3JtX2RyaXZl
cl91bnJlZ2lzdGVyKzB4MTQvMHgyMA0KPiBbICAxOTQuMzYxNzUzXSAgY3RjdV9kcml2ZXJf
ZXhpdCsweDE4LzB4ZGY4IFtjb3Jlc2lnaHRfY3RjdV0NCj4gWyAgMTk0LjM2NzMwOF0gIF9f
YXJtNjRfc3lzX2RlbGV0ZV9tb2R1bGUrMHgxYmMvMHgyOTgNCj4gWyAgMTk0LjM3MjI0MF0g
IGludm9rZV9zeXNjYWxsKzB4NTQvMHgxMGMNCj4gWyAgMTk0LjM3NjExNF0gIGVsMF9zdmNf
Y29tbW9uLmNvbnN0cHJvcC4wKzB4YzAvMHhlMA0KPiBbICAxOTQuMzgwOTU2XSAgZG9fZWww
X3N2YysweDFjLzB4MjgNCj4gWyAgMTk0LjM4NDM3NF0gIGVsMF9zdmMrMHg1NC8weDNhMA0K
PiBbICAxOTQuMzg3NjI2XSAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHhhMC8weGU0DQo+IFsg
IDE5NC4zOTE5NTFdICBlbDB0XzY0X3N5bmMrMHgxOTgvMHgxOWMNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEppZSBHYW4gPGppZS5nYW5Ab3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+IENo
YW5nZXMgaW4gdjM6DQo+IC0gZXRtNHg6IGJhaWwgb3V0IHdpdGggV0FSTl9PTigpIHdoZW4g
ZHJ2ZGF0YSBpcyBtaXNzaW5nIGluc3RlYWQgb2YNCj4gICAgc2lsZW50bHkgc2tpcHBpbmcg
dGVhcmRvd24sIGFuZCBjYWxsIGV0bTRfcmVtb3ZlX2RldigpIGFmdGVyDQo+ICAgIHBtX3J1
bnRpbWVfZ2V0X3N5bmMoKSBzbyB0aGUgZGV2aWNlIGlzIHJlc3VtZWQgYmVmb3JlIGl0IGlz
IHRvcm4gZG93bi4NCj4gLSBjb2xsZWN0IHJldmlld2VkLWJ5IHRhZyBmcm9tIExlby4NCj4g
LSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNzAyLWZpeC1j
bG9jay1yZWZjb3VudC11bmJhbGFuY2UtdjItMC0yMzgzZmJiOTk1MmVAb3NzLnF1YWxjb21t
LmNvbQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBCYWxhbmNlIHRoZSBydW50aW1lIFBN
IHN0YXRlIGluIHRoZSByZW1vdmUgcGF0aDogYWZ0ZXINCj4gICAgcG1fcnVudGltZV9nZXRf
c3luYygpIGFuZCBwbV9ydW50aW1lX2Rpc2FibGUoKSwgYWxzbyBjYWxsDQo+ICAgIHBtX3J1
bnRpbWVfc2V0X3N1c3BlbmRlZCgpIGFuZCBwbV9ydW50aW1lX3B1dF9ub2lkbGUoKSBzbyB0
aGUgZGV2aWNlIGlzDQo+ICAgIGxlZnQgc3VzcGVuZGVkIHdpdGggYSBiYWxhbmNlZCB1c2Fn
ZSBjb3VudCBvbmNlIHRoZSBkZXZtIGFjdGlvbiBoYXMNCj4gICAgZGlzYWJsZWQgdGhlIGNs
b2Nrcy4NCj4gLSBQaWNrZWQgdXAgUmV2aWV3ZWQtYnkgZnJvbSBZZW9yZXVtIFl1biBvbiBw
YXRjaCAxLg0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NjA3MDEtZml4LWNsb2NrLXJlZmNvdW50LXVuYmFsYW5jZS12MS0wLTMyMWRjNjNjMWY5MEBv
c3MucXVhbGNvbW0uY29tDQo+IA0KPiAtLS0NCj4gSmllIEdhbiAoMik6DQo+ICAgICAgICBj
b3Jlc2lnaHQ6IEZpeCBjbG9jayByZWZjb3VudCBpbWJhbGFuY2Ugb24gcGxhdGZvcm0gcmVt
b3ZlDQo+ICAgICAgICBjb3Jlc2lnaHQ6IHRub2M6IEZpeCBjbG9jayByZWZjb3VudCBpbWJh
bGFuY2Ugb24gcGxhdGZvcm0gcmVtb3ZlDQo+IA0KPiAgIGRyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtY2F0dS5jICAgICAgIHwgIDggKysrKysrKysNCj4gICBkcml2
ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNwdS1kZWJ1Zy5jICB8ICA4ICsr
KysrKysrDQo+ICAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGN1
LWNvcmUuYyAgfCAgOCArKysrKysrKw0KPiAgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdo
dC9jb3Jlc2lnaHQtZXRtNHgtY29yZS5jIHwgMTMgKysrKysrKysrKystLQ0KPiAgIGRyaXZl
cnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZnVubmVsLmMgICAgIHwgIDggKysr
KysrKysNCj4gICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXJlcGxp
Y2F0b3IuYyB8ICA4ICsrKysrKysrDQo+ICAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1zdG0uYyAgICAgICAgfCAgOCArKysrKysrKw0KPiAgIGRyaXZlcnMvaHd0
cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtdG1jLWNvcmUuYyAgIHwgIDggKysrKysrKysN
Cj4gICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRub2MuYyAgICAg
ICB8ICA4ICsrKysrKysrDQo+ICAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVz
aWdodC10cGl1LmMgICAgICAgfCAgOCArKysrKysrKw0KPiAgIDEwIGZpbGVzIGNoYW5nZWQs
IDgzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1p
dDogYmU1YzkzZmE2NzRmMGZjM2M4ZjM1OWMyMTQzYWJjZTZiYmI0MjJlNg0KPiBjaGFuZ2Ut
aWQ6IDIwMjYwNzAxLWZpeC1jbG9jay1yZWZjb3VudC11bmJhbGFuY2UtZTdjNDY3MTM2YTg2
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoNCg==

