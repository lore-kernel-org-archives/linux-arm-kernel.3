Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8DEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=eZbA7qwbD0L+jiCUxvoRvf44D7eR7R+L9wIpeMQLFC8=; b=eozSrwqse7rEBJhHVco5jHZB4o
	oH80w8Oa1TBnePc8iSIq3CV1jJk27e9pRz2PASxil2xUJXD7YNCJh0kpNmUlnMCSE5/xLdrL8PXAM
	PDe9cZb93sBDU4TQxWctwDlQPy6UoJMQRBVTWu+AYqW2y2uj+yU71dc3vjqg5DSJouWKY9G1LJimL
	qCfWXtsz5Q2uIpgsiN6OLX+3Gnwvk3U+7U+QbOrdFSG+1kWuR43Wolp1NE7svca+xIBweyCxJq0DJ
	AzojaD9OgF/JJM7HGJDIgOUfAe4gMOw9JRNVUYqZRhI8avxZpXYojZuYMGsLtv0lPB0yggZ1HqlG1
	U0vuRM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziII-00000004JjR-1qE6;
	Tue, 01 Apr 2025 20:33:10 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziDW-00000004JJ9-3npM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:28:18 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250401202809euoutp016391efb430f8027a2e0b3a91b04be3ea~yS771D05T0215402154euoutp01k
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Apr 2025 20:28:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250401202809euoutp016391efb430f8027a2e0b3a91b04be3ea~yS771D05T0215402154euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743539289;
	bh=eZbA7qwbD0L+jiCUxvoRvf44D7eR7R+L9wIpeMQLFC8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HK4VhytrxclQj7jRmVSNKQdjrLLLuWKRnTAbff+uFBfkR9hwyIknQ8vaglgV3Uv1v
	 0IqPQ/9dPO+yJQ/fNxf44SP864+g6D5MWE4LaDways2z2wFEGaBQhA+TAaiiHEYgSW
	 xBla261hNdXivbcppcmrxX9mvN5PoHHk0iJ6QBxA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250401202808eucas1p1cbde4ad5d798800f4a42896a7566c582~yS77QXEcI2655026550eucas1p1z;
	Tue,  1 Apr 2025 20:28:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 5E.57.20397.85C4CE76; Tue,  1
	Apr 2025 21:28:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250401202808eucas1p2d2db882c5b7e39bca39e0cf8d7696ca5~yS76t8r0c2324323243eucas1p2J;
	Tue,  1 Apr 2025 20:28:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250401202808eusmtrp1a30c07f7ab3fc440c9cebcce7ddeb856~yS76tZl_33253532535eusmtrp1P;
	Tue,  1 Apr 2025 20:28:08 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-a0-67ec4c58fbd9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 8E.71.19654.75C4CE76; Tue,  1
	Apr 2025 21:28:07 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250401202807eusmtip2ac2c6ec18eaf968e8cbe8fb5590c3d2e~yS76G8IA-2881128811eusmtip2m;
	Tue,  1 Apr 2025 20:28:07 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel
	<joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar
	<jsnitsel@redhat.com>
Subject: [PATCH] iommu/exynos: Fix suspend/resume with IDENTITY domain
Date: Tue,  1 Apr 2025 22:27:31 +0200
Message-Id: <20250401202731.2810474-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7oRPm/SDc63qVg8mLeNzeLXFwuL
	mTNOMFp0zt7AbvF4+Wxmi/PngaxNj6+xWsw4v4/JYu2Ru+wWBz88YbVouWPqwO3x5OA8Jo81
	89Ywemxa1cnmsXlJvceLzTMZPd7vu8rm0bdlFaPH501yHls/32YJ4IzisklJzcksSy3St0vg
	ynh75xpLwTK+ilsb3rM2MDbwdDFyckgImEg07XrG2sXIxSEksIJRYsX12WwQzhdGiQVPmxlB
	qoQEPjNKfJqnDdPx+ccDFoii5YwSW1ceRejYdf8QK0gVm4ChRNfbLqAEB4eIQIrE5ze5IDXM
	AhuZJJava2EHqREWcJM4uncqE0gNi4CqxPlOb5Awr4C9xN7785ghlslL7D94lhkiLihxcuYT
	FhCbGSjevHU2M8hMCYEbHBIL/p5ggWhwkbi16gEbhC0s8er4FnYIW0bi9OQeFoiGdqDXft9n
	gnAmMEo0PL/FCFFlLXHn3C+wq5kFNCXW79KHCDtK3H77lB0kLCHAJ3HjrSDEEXwSk7ZNZ4YI
	80p0tAlBVKtJzDq+Dm7twQuXoH7xkGjqnsUKCdBYid/7NzJPYFSYheS1WUhem4VwwwJG5lWM
	4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBSev0v+NfdzCuePVR7xAjEwfjIUYJDmYlEd6I
	ry/ThXhTEiurUovy44tKc1KLDzFKc7AoifMu2t+aLiSQnliSmp2aWpBaBJNl4uCUamDyePfn
	5rT4pT1Wb64K3Q6q3bnX7oKqv3FY5aGt3JI7dP5wT46U8lxeuYN52S7+pTZh37n9puskmHzx
	Ni7Iaft9nl9VOnPrK5st8xw3/EyU7ZLne6Af0sLx5gtX1Z5v0woTdXsrm5Tk1/60XHZzQ86H
	JvHagOdfUksT57y5dbbz98bLcjyrb+5gv5si2Cpc//S9y+4jjUVPnuc9OBejskNmE5OO8dLs
	Cq/+5Y3F/9z3z6xKnx5qlXHx6MrWnrs3Mn+z3Tmxa9aCSf/D1QqTeKydE+J/9fnWfZuvtHjd
	0n/rjV9HbXYwmHbju3d2QNbmabJxS/SMIoVnLG//u1vOZKcSlx9nmuCMA92bfgXK8BQosRRn
	JBpqMRcVJwIApIvy0ckDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42I5/e/4Pd0InzfpBh9dLB7M28Zm8euLhcXM
	GScYLTpnb2C3eLx8NrPF+fNA1qbH11gtZpzfx2Sx9shddouDH56wWrTcMXXg9nhycB6Tx5p5
	axg9Nq3qZPPYvKTe48XmmYwe7/ddZfPo27KK0ePzJjmPrZ9vswRwRunZFOWXlqQqZOQXl9gq
	RRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlvL1zjaVgGV/FrQ3vWRsYG3i6
	GDk5JARMJD7/eMDSxcjFISSwlFFixey7jBAJGYmT0xpYIWxhiT/Xutggij4xSsx8v5EdJMEm
	YCjR9RYkwckhIpAmMbG9AWwSs8B2JokDk56BdQsLuEkc3TuVqYuRg4NFQFXifKc3SJhXwF5i
	7/15zBAL5CX2HzzLDBEXlDg58wkLiM0MFG/eOpt5AiPfLCSpWUhSCxiZVjGKpJYW56bnFhvp
	FSfmFpfmpesl5+duYgRGy7ZjP7fsYFz56qPeIUYmDsZDjBIczEoivBFfX6YL8aYkVlalFuXH
	F5XmpBYfYjQFOm8is5Rocj4wXvNK4g3NDEwNTcwsDUwtzYyVxHnZrpxPExJITyxJzU5NLUgt
	gulj4uCUamDaskBA4N7ruyvL0i8sP5Pbf6ksfWNpp87nAP/D4qL7t3JdrYxlkNCrCjFsv2c2
	aX419/uvOcy7rVbXfPZV+brlWcvnuIkXV7++ecwo/E7y/ccZ/+/Oe6Gxrdz4n3vlTnGHZydb
	J1wzd69+pVww4Z53e0rQuan2s632hd7fFL/sZP/1aWdUvivXRGs5Wa5Q8i1ZtX7FXRYRRtNc
	XuXH0Zm8yYVlvqn5vw8qZq0x35zmpb8islZH/ukpZtXzTnXmnR8q7nW6/RUM/yY6i59R9KrT
	7BzmjRP+ek95NZ8/Mu7y8mtbhd/1TeecNYFj63y7L0eO/atZ/5cvb5qZ55XD7syxs0XstPQn
	/b7UaL5vyaUUJZbijERDLeai4kQAhqKveR8DAAA=
X-CMS-MailID: 20250401202808eucas1p2d2db882c5b7e39bca39e0cf8d7696ca5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250401202808eucas1p2d2db882c5b7e39bca39e0cf8d7696ca5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250401202808eucas1p2d2db882c5b7e39bca39e0cf8d7696ca5
References: <CGME20250401202808eucas1p2d2db882c5b7e39bca39e0cf8d7696ca5@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_132816_327893_11D43DE4 
X-CRM114-Status: GOOD (  15.90  )
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

Commit bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe
path") changed the sequence of probing the SYSMMU controller devices and
calls to arm_iommu_attach_device(), what results in resuming SYSMMU
controller earlier, when it is still set to IDENTITY mapping. Such change
revealed the bug in IDENTITY handling in the exynos-iommu driver. When
SYSMMU controller is set to IDENTITY mapping, data->domain is NULL, so
adjust checks in suspend & resume callbacks to handle this case
correctly.

Fixes: b3d14960e629 ("iommu/exynos: Implement an IDENTITY domain")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This fixes random issues observed on various ARM 32bit Exynos SoC based
boards, like Odroid-XU3.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/iommu/exynos-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 69e23e017d9e..317266aca6e2 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -832,7 +832,7 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
 		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
-		if (&data->domain->domain != &exynos_identity_domain) {
+		if (data->domain) {
 			dev_dbg(data->sysmmu, "saving state\n");
 			__sysmmu_disable(data);
 		}
@@ -850,7 +850,7 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
 		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
-		if (&data->domain->domain != &exynos_identity_domain) {
+		if (data->domain) {
 			dev_dbg(data->sysmmu, "restoring state\n");
 			__sysmmu_enable(data);
 		}
-- 
2.34.1


