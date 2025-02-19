Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2E5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWGcCY/BKKB/qK6QLbk19gz+fzovv0S7Buc7zIUdEVM=; b=XKdzL16kkOq1NwlOP02+i9ymEO
	Q8UkuSV6oYNXxnoUK/siQFfGR9KoN7wuK/YeODkzKGmxelwFPM1I42CM6ICwFK152HLnMgi8qRJVA
	VwdjBZzRcWx3XgsE7BCLEzZIWEraGqu2AUIidYMHRAqGvYtfs4CnS18AfzZMr+Sy6qNouysBgY0JJ
	HzI12ZiXGjX4bbQ0YnqepsVO7Ax7Z4qKWPq91cxx7qggWag3of9orkGC6GnDvMs5HJfcfYGcHtiz+
	4oyT65HnzMFohzfUbzvCtRCif2tzGwjLEHpwxGgU9xmuLQzCenkik991I06oWVuSejDk8/n9yhWs/
	ku+NkMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tki4U-0000000CLmP-42rt;
	Wed, 19 Feb 2025 11:16:54 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tki2l-0000000CLIl-0ZZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:15:08 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250219111503epoutp0351074ca7ae9adb7cefc3985844777f43~ll8UJ00jb0926409264epoutp03i
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 11:15:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250219111503epoutp0351074ca7ae9adb7cefc3985844777f43~ll8UJ00jb0926409264epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739963703;
	bh=GWGcCY/BKKB/qK6QLbk19gz+fzovv0S7Buc7zIUdEVM=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=oNJKgvtbYjSUN0eA8kn0lslJtn+kCv5S2pihCZSdTyb9psAozaPMH+sfwrpNELcRn
	 /n0oKA9o6Q9h0/hG1gplzeTaqYfggqHRDyNlR8WkaoWb4gjWWA7Gr6JguIsphaQoei
	 f6jIs2RinS6swkbnmpZ5Wnfe4Ozklr8ruPlNCW+M=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250219111503epcas5p4cb80d56939c54b0b36ce34dfcfb104fb~ll8Txcfhq1795217952epcas5p4R;
	Wed, 19 Feb 2025 11:15:03 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YyYhN5j71z4x9Px; Wed, 19 Feb
	2025 11:15:00 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	24.C5.19933.43DB5B76; Wed, 19 Feb 2025 20:15:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219111500epcas5p134654617ad4a7306a5e3a02d7a398586~ll8RKu8wW2532725327epcas5p1Z;
	Wed, 19 Feb 2025 11:15:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250219111500epsmtrp24ae6f697da0e364610ff71a3783ab974~ll8RFbs-_0748807488epsmtrp2z;
	Wed, 19 Feb 2025 11:15:00 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-71-67b5bd34287d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	18.ED.18729.43DB5B76; Wed, 19 Feb 2025 20:15:00 +0900 (KST)
Received: from INBRO002756 (unknown [107.111.84.9]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250219111458epsmtip1ad4d3921769d3af8d3e5da40e4d93eec~ll8PYoXN53135331353epsmtip1y;
	Wed, 19 Feb 2025 11:14:58 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	"'Rob Herring'" <robh@kernel.org>, "'Krzysztof	Kozlowski'"
	<krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-fsd@tesla.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250219085726.70824-2-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 2/2] arm64: dts: tesla: Change labels to lower-case
Date: Wed, 19 Feb 2025 16:44:57 +0530
Message-ID: <0a8d01db82bf$83d4b000$8b7e1000$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH4fj3DFj4PAdpK0pFVpNwdI7DR8QKoHdT8AaxUyEyy8d6aEA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmlq7J3q3pBn0vNS22vNrMYrFm7zkm
	i/lHzrFavJx1j81i7+ut7BabHl9jtXj4Ktzi8q45bBYzzu9jstgw4x+Lxf89O9gtPt2Kc+Dx
	2LSqk83jzrU9bB6bl9R7/Guay+7xeZNcAGtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmB
	oa6hpYW5kkJeYm6qrZKLT4CuW2YO0HFKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKU
	nAKTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMxX9XshTM5ap4+7GJqYHxEWcXIweHhICJxJm+
	4C5GLg4hgd2MEl+73rJBOJ8YJab/62PqYuQEcr4xSkzdEAJigzSs6tzNClG0l1Hi5PW5TBDO
	C0aJb3svsoBUsQnoSuxY3AY2SkTgH7NE65I9bCAJTgEXiXsX3rCD2MIC7hJbOt6B2SwCqhKz
	f75lBLF5BSwlPt64wQRhC0qcnPkEbCizgLbEsoWvmSHOUJD4+XQZK4gtIuAkcfrka3aIGnGJ
	l0ePsIMslhBYyiEx6egBdogGF4npC+8yQtjCEq+Ob4GKS0l8freXDcKulli/YR4LhN3BKNG4
	vQbCtpfY+egmCyjAmAU0Jdbv0ofYxSfR+/sJEyQceSU62oQgqlUlmt9dhZoiLTGxu5sVwvaQ
	uLxiBjR4LzJK7D93jHkCo8IsJG/OQvLmLCTvzELYvICRZRWjZGpBcW56arFpgVFeajk8wpPz
	czcxgtOultcOxocPPugdYmTiYDzEKMHBrCTC21a/JV2INyWxsiq1KD++qDQntfgQoykw7Ccy
	S4km5wMTf15JvKGJpYGJmZmZiaWxmaGSOG/zzpZ0IYH0xJLU7NTUgtQimD4mDk6pBqYoE0Pj
	Xws/nH+TvfbjO9+PdXOuvW08nqGSIbCMo4z3np9vQOK7vZ6V3vrzGeo5eatCarxMJs5U2TDn
	m671U+PKxweYZhnzsrt9Xrss5KzstHVb4h/uqs5rkSpQeHC+L7JGdd8zc+fpdZ8XPlcxn+hw
	wePsj8BDTIoltl833Ty9tP+yhBYf/83upGX87/P+qD4vPr4udR+3heHjiLlTr0+U99dnT9nA
	kmoZlLRwQfGupzHBs437nR/a+HziT11+5cWGm+07fn/47TBlqtYRy+rvPc+snO7xP7hRcPsi
	00+FvgPPrH/JzvG4XPXPOPnvh1/HMrw9XkYu+SZyzXh5f+TE9+vSNvaZblWStHTJ6dmoxFKc
	kWioxVxUnAgAPpvkqUQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTtdk79Z0g8+LeC22vNrMYrFm7zkm
	i/lHzrFavJx1j81i7+ut7BabHl9jtXj4Ktzi8q45bBYzzu9jstgw4x+Lxf89O9gtPt2Kc+Dx
	2LSqk83jzrU9bB6bl9R7/Guay+7xeZNcAGsUl01Kak5mWWqRvl0CV8bjrdMZC3o5Kh5eb2Fu
	YOxk72Lk5JAQMJFY1bmbtYuRi0NIYDejxKan31khEtIS1zdOgCoSllj57zk7RNEzRomzk3Yx
	gyTYBHQldixuYwOxRQTaWCR2bsyGKDrLKNG4+CJYEaeAi8S9C2/AJgkLuEts6XgHZrMIqErM
	/vmWEcTmFbCU+HjjBhOELShxcuYTFhCbWUBbovdhKyOMvWzha2aIixQkfj5dxgqx2Eni9MnX
	7BA14hIvjx5hn8AoNAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1
	kvNzNzGCo0xLcwfj9lUf9A4xMnEwHmKU4GBWEuFtq9+SLsSbklhZlVqUH19UmpNafIhRmoNF
	SZxX/EVvipBAemJJanZqakFqEUyWiYNTqoHJxFZqpcCVjNYKDrbCi35fXfQPRhxZd4eXP1Pf
	8ptGg9uBR2ulfzAedMhvurwnwGn/3wrnzbOPd52v/D+ffy5D9C2nOP/r21ffOuLw8MXSH9qh
	xuv7w3mWbS8IbLWLPebhfGXDtIStXrqXNxUt+LMypH6CxbbVq6TYvVM2Xz8xL8I1922MzY9Z
	/Gddk0/ODWQ5tcj18M1fitz8N6fxH/xivz3jdkJH3+6PGVaqyvIHXGevWPfx1tTwQ0/CuTd1
	locEh/Uqe6+v/hWR0/dFkeucYjn3pPP8T6QjFFdVuASfnrRw0s6Wd92p5gKTuB9+u35xz6aK
	n9o3P1dMtOERbBVdonK6/JOM0U0r3gdsb9LslViKMxINtZiLihMBZYNe5yEDAAA=
X-CMS-MailID: 20250219111500epcas5p134654617ad4a7306a5e3a02d7a398586
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250219085736epcas5p1ab7bb90b526e8b9503a9adce76df8ec7
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
	<CGME20250219085736epcas5p1ab7bb90b526e8b9503a9adce76df8ec7@epcas5p1.samsung.com>
	<20250219085726.70824-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_031507_489607_BB6BDEF5 
X-CRM114-Status: GOOD (  10.99  )
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

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Wednesday, February 19, 2025 2:27 PM
> To: Peter Griffin <peter.griffin=40linaro.org>; Andr=C3=A9=20Draszik=0D=
=0A>=20<andre.draszik=40linaro.org>;=20Tudor=20Ambarus=20<tudor.ambarus=40l=
inaro.org>;=0D=0A>=20Rob=20Herring=20<robh=40kernel.org>;=20Krzysztof=20Koz=
lowski=20<krzk+dt=40kernel.org>;=0D=0A>=20Conor=20Dooley=20<conor+dt=40kern=
el.org>;=20Alim=20Akhtar=0D=0A>=20<alim.akhtar=40samsung.com>;=20linux-fsd=
=40tesla.com;=20linux-arm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-s=
amsung-soc=40vger.kernel.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linu=
x-kernel=40vger.kernel.org=0D=0A>=20Cc:=20Krzysztof=20Kozlowski=20<krzyszto=
f.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=5BPATCH=202/2=5D=20arm64:=20=
dts:=20tesla:=20Change=20labels=20to=20lower-case=0D=0A>=20=0D=0A>=20DTS=20=
coding=20style=20expects=20labels=20to=20be=20lowercase.=20=20No=20function=
al=20impact.=0D=0A>=20Verified=20with=20comparing=20decompiled=20DTB=20(dtx=
_diff=20and=20fdtdump+diff).=0D=0A>=20=0D=0A>=20Signed-off-by:=20Krzysztof=
=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20---=0D=0AReviewe=
d-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A=0D=0A

