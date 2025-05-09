Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCFEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPWgMTqoBA3G7qPvTb/wIs6TJofMudda6ovl5E3tato=; b=ZUsbLqRVgwwpHDSaWng5HIUbee
	RFgwTxVpvsaVrG75wdf6d4UlZ9UlzLMZO5obd3JvB3sDvF2wUOQNaQsOQJHLqzIdOpOV1TtaAjHQp
	RruOptjAmGTaIQphE85KeuZ3biGEQ5XLUEyQ4sY8yta/O87Xl7BRPI9pbEw5y3bTBY/B7/KFeDoOO
	PzCuyWc5DeZuKZ4q6O0QDVLgTbPXEx5EaUD6jlTZoCTr9zPHgBOEYPQSdcZzh+o5wKti7a2Tnjc2R
	0hgxz5WgsJ8doe98YyWTYR0mhhYMZfDn0MQnudwVOIsp94sy9xDXBWWVsDbZE44NjbY6rUMsZipfy
	wmbbfdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKb1-00000003CQC-1sJg;
	Fri, 09 May 2025 10:04:47 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJsD-000000034n4-2rT9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=YTsbKWTYCKG/IzKP6ByjaRHK5LKm1VEeQJxr8iPN39s=; b=i
	cUEij9gVaKlyfTnRCNjYhBt0s0/fCVWeKWfDog1I4mD4NS6jA9YWk2qSUo8ubVNw
	6d6UMJZtIPVCyeTZJWGA1EcwGjAwIUNKmVx4VPjCSGTIJ+HBM4NufYym4fWWuFxt
	CmxBiN1lUjXppgetgs2T3JJsBmpCWTMwS2+yW78FH8=
Received: from xavier_qy$163.com ( [103.126.24.24] ) by
 ajax-webmail-wmsvr-40-140 (Coremail) ; Fri, 9 May 2025 17:17:47 +0800 (CST)
X-Originating-IP: [103.126.24.24]
Date: Fri, 9 May 2025 17:17:47 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "David Hildenbrand" <david@redhat.com>
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, dev.jain@arm.com,
	ioworker0@gmail.com, akpm@linux-foundation.org,
	catalin.marinas@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, willy@infradead.org, ziy@nvidia.com
Subject: Re:Re: [PATCH v4] arm64/mm: Optimize loop to reduce redundant
 operations of contpte_ptep_get
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <9ada79ec-f2b4-42bc-84f9-3f7b461ad829@redhat.com>
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
 <20250508070353.2370826-1-xavier_qy@163.com>
 <9ada79ec-f2b4-42bc-84f9-3f7b461ad829@redhat.com>
X-NTES-SC: AL_Qu2fBPuTvUot4SGaYOkfmkgWgus/WcW2u/Qj3IRSO5FwjB/o6ioBZXtMF2nw19+OOxmBrheYYTVKy/xaWZFUcrobURIGU0Tkr5sTVmfzWLRZjw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <29f1ebb9.8e60.196b45626fb.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jCgvCgDnL_88yB1o3tEAAA--.7579W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTR9IEGgdwSzvVwAAsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_021830_031586_4FDCC020 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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

CgoKQXQgMjAyNS0wNS0wOCAxNjozMDoxNCwgIkRhdmlkIEhpbGRlbmJyYW5kIiA8ZGF2aWRAcmVk
aGF0LmNvbT4gd3JvdGU6Cj5PbiAwOC4wNS4yNSAwOTowMywgWGF2aWVyIFhpYSB3cm90ZToKPj4g
VGhpcyBjb21taXQgb3B0aW1pemVzIHRoZSBjb250cHRlX3B0ZXBfZ2V0IGFuZCBjb250cHRlX3B0
ZXBfZ2V0X2xvY2tsZXNzCj4+IGZ1bmN0aW9uIGJ5IGFkZGluZyBlYXJseSB0ZXJtaW5hdGlvbiBs
b2dpYy4gSXQgY2hlY2tzIGlmIHRoZSBkaXJ0eSBhbmQKPj4geW91bmcgYml0cyBvZiBvcmlnX3B0
ZSBhcmUgYWxyZWFkeSBzZXQgYW5kIHNraXBzIHJlZHVuZGFudCBiaXQtc2V0dGluZwo+PiBvcGVy
YXRpb25zIGR1cmluZyB0aGUgbG9vcC4gVGhpcyByZWR1Y2VzIHVubmVjZXNzYXJ5IGl0ZXJhdGlv
bnMgYW5kCj4+IGltcHJvdmVzIHBlcmZvcm1hbmNlLgo+PiAKPj4gSW4gb3JkZXIgdG8gdmVyaWZ5
IHRoZSBvcHRpbWl6YXRpb24gcGVyZm9ybWFuY2UsIGEgdGVzdCBmdW5jdGlvbiBoYXMgYmVlbgo+
PiBkZXNpZ25lZC4gVGhlIGZ1bmN0aW9uJ3MgZXhlY3V0aW9uIHRpbWUgYW5kIGluc3RydWN0aW9u
IHN0YXRpc3RpY3MgaGF2ZQo+PiBiZWVuIHRyYWNlZCB1c2luZyBwZXJmLCBhbmQgdGhlIGZvbGxv
d2luZyBhcmUgdGhlIG9wZXJhdGlvbiByZXN1bHRzIG9uIGEKPj4gY2VydGFpbiBRdWFsY29tbSBt
b2JpbGUgcGhvbmUgY2hpcDoKPgo+Rm9yIHRoZSBmdXR1cmUsIHBsZWFzZSBkb24ndCBwb3N0IHZO
KzEgYXMgcmVwbHkgdG8gdk4uCgpJIHdpbGwgcGF5IGF0dGVudGlvbiB0byBpdCB3aGVuIEkgc3Vi
bWl0IGl0IGxhdGVyLiBUaGFuayB5b3UgZm9yIHRoZSByZW1pbmRlci4KCj4KPi0tIAo+Q2hlZXJz
LAo+Cj5EYXZpZCAvIGRoaWxkZW5iCgotLQpUaGFua3MsClhhdmllcgo=

