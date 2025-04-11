Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBE5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6815fdXt5wx/NIZwToT5MJ1KOs1DW9jxPYWMNNSKLkM=; b=HTNqoa/dgPr2xhgxPZMgvC8deP
	ZgCIl3nSAC4zpoctQWJRBvZfubw8BiMY448eF+x6MWdFgIaXZ4lE3uNNy8qzZhOutd3WagiafTXdi
	CNxqmvoY8RjEYzlc6Y7CkDml2LBMIqoLZ2sW0322/2Lr++YUZfnGyDVHPnSnZf9kNM7PcYmObSdlH
	DN1yn/0BB0xgQhfo8TOslLjDCum6vRSozUBsEoGlD78IqZ4OizA3nd9lQryFuOFirfYOYsHRXzIqF
	FzHOcng2cGFhlw+XJc/BHWhcgZ4CxwsOVdkdYxnwE0GGghhmhrAArYph4fM692oR9Az+ZPdl2hd1Y
	oXeYDInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37zO-0000000CjvS-1jQa;
	Fri, 11 Apr 2025 06:35:46 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Jv-0000000Cccc-2NdD;
	Fri, 11 Apr 2025 05:52:56 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ALeKFZ003742;
	Fri, 11 Apr 2025 05:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6815fd
	Xt5wx/NIZwToT5MJ1KOs1DW9jxPYWMNNSKLkM=; b=dDywqT0HCG42MA3lFXxlOx
	If33JtZB1VBcsPEgGE1kfQUAVh7XUAbAteN+SzNGPemXoF/Ax8+wuQJr+aX76fyD
	ou6jK4UtumMGSG+AFDmPBrBcbvsQsx8zFO02lVUElPhkWMzGdPKBabYlt3Rcbmsx
	82cQexdGSvQef6v4QwZ3zJIuyp41HKyHMR4hi603Ki/LaVWLDz6HJQi2C4Q1IbNy
	IGYVOnPAlfQ4PiOj4QCAfODygKhsfN61nTGwmZQQCY0o0gzTZEPn1kSvlhp+NUJu
	N6hjDRSRZ2dKD7rF+j6AnBo3r+rzKBUS+rW0nGoLeTLpF09QoLCgYEs/b7841LMw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xe13vgnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:52:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1blvD025510;
	Fri, 11 Apr 2025 05:52:47 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm9hrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:52:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5qjmG34275820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:52:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB03320043;
	Fri, 11 Apr 2025 05:52:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E76220040;
	Fri, 11 Apr 2025 05:52:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:52:45 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DD900602EA;
	Fri, 11 Apr 2025 15:52:41 +1000 (AEST)
Message-ID: <4c32923d60e8d67a4a3194a405b5a422e08e280c.camel@linux.ibm.com>
Subject: Re: [PATCH v13 04/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
        sweettea-kernel@dorminy.me
Date: Fri, 11 Apr 2025 15:52:37 +1000
In-Reply-To: <20250313161038.8bd10fa54778e984d8f849d7@linux-foundation.org>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
		<20250211161404.850215-5-ajd@linux.ibm.com>
	 <20250313161038.8bd10fa54778e984d8f849d7@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a9C5cwqg82L-CU9EonpgcGBjo0_UaNDx
X-Proofpoint-GUID: a9C5cwqg82L-CU9EonpgcGBjo0_UaNDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_225255_605800_5485C903 
X-CRM114-Status: GOOD (  17.71  )
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

T24gVGh1LCAyMDI1LTAzLTEzIGF0IDE2OjEwIC0wNzAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+
IE9uIFdlZCwgMTIgRmViIDIwMjUgMDM6MTM6NTcgKzExMDAgQW5kcmV3IERvbm5lbGxhbgo+IDxh
amRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDkzMWMz
OGUxNjQ5OSAoIm1tL3BhZ2VfdGFibGVfY2hlY2s6IHJlbW92ZQo+ID4gdW51c2VkCj4gPiBwYXJh
bWV0ZXIgaW4gW19fXXBhZ2VfdGFibGVfY2hlY2tfcHVkX2NsZWFyIikuCj4gPiAKPiA+IFJlaW5z
dGF0ZSBwcmV2aW91c2x5IHVudXNlZCBwYXJhbWV0ZXJzIGZvciB0aGUgcHVycG9zZSBvZgo+ID4g
c3VwcG9ydGluZwo+ID4gcG93ZXJwYyBwbGF0Zm9ybXMsIGFzIG1hbnkgZG8gbm90IGVuY29kZSB1
c2VyL2tlcm5lbCBvd25lcnNoaXAgb2YKPiA+IHRoZQo+ID4gcGFnZSBpbiB0aGUgcHRlLCBidXQg
aW5zdGVhZCBpbiB0aGUgYWRkcmVzcyBvZiB0aGUgYWNjZXNzLgo+IAo+IE15IHg4Ni02NCBhbGxt
b2Rjb25maWcgZXhwbG9kZWQuCj4gCj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmg6
IEluIGZ1bmN0aW9uICdwdWRwX2VzdGFibGlzaCc6Cj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmg6MTQ0Mzo0NjogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMgo+IG9mICdwYWdlX3Rh
YmxlX2NoZWNrX3B1ZF9zZXQnIG1ha2VzIGludGVnZXIgZnJvbSBwb2ludGVyIHdpdGhvdXQgYQo+
IGNhc3QgWy1XZXJyb3I9aW50LWNvbnZlcnNpb25dCj4gwqAxNDQzIHzCoMKgwqDCoMKgwqDCoMKg
IHBhZ2VfdGFibGVfY2hlY2tfcHVkX3NldCh2bWEtPnZtX21tLCBwdWRwLCBwdWQpOwo+IMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+Cj4gwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHVkX3QgKgo+IAo+IAo+IAo+ICNpZmRlZiBD
T05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRAo+IHN0YXRpYyBpbmxpbmUg
cHVkX3QgcHVkcF9lc3RhYmxpc2goc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHVkX3QgKnB1
ZHAsIHB1ZF90IHB1ZCkKPiB7Cj4gCXBhZ2VfdGFibGVfY2hlY2tfcHVkX3NldCh2bWEtPnZtX21t
LCBwdWRwLCBwdWQpOwo+IAkuLi4KPiAKClNvcnJ5LCBteSBlbWFpbCBmaWx0ZXJzIHNlbnQgdGhp
cyB0byB0aGUgd3JvbmcgZm9sZGVyIGZvciBzb21lIHJlYXNvbgphbmQgSSBkaWRuJ3Qgc2VlIHRo
aXMuIEkndmUgc2VudCB2MTQ6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz00NTIyNDcKClRoYW5rcywKLS0gCkFuZHJldyBEb25u
ZWxsYW4gICAgT3pMYWJzLCBBREwgQ2FuYmVycmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVz
dHJhbGlhIExpbWl0ZWQK


