Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FFFEC1430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=; b=iyNq4T+fiAGP43o4K9x/C3Fp7+
	K49BUIpf5BauW8sK0fZSLpsEja7zXgYGTes1BctZwBCQKR4mZYiwBR4nrciKQS7l4zoG5wAq6iZhc
	9Kj/j7tUz71nvKd6VJfuZjXhFuPWzNo+n6wH3lYj/9HVVAycSOfXsgLY7mRyI3ELqSbjAp78mgUif
	yGTQGDypCwpp6MVJnRXot3E8JkOh39V+aIj1AXTzKSDwfPOiW7qKdr5b5MobTPpK8okIVJxu2cgx6
	3xxJ6i9iuCChe5t9Ya2iUhcS5UU/5F5i0QSROm0rPkTzQj+QPo5BHeldY6g6UsRRaamB/0T3Q7Evf
	5k9dcAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOdF-0000000F83X-3zz9;
	Tue, 03 Mar 2026 12:13:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOdD-0000000F839-1Sai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:13:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nGLp3349612
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Mar 2026 12:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9ThQZCHpRyOYZogBfVZbhe1
	AsrapF6ZWMmRMx4dKmg=; b=PJPsutLGKx6Z/C+LJW1AwgvhyWXOFTNddc1IU7eE
	dMiYq+/eRmJb8RHBM2MlbKnC9hYidZuiH7jXPVu/BvaFZnWLyDMWIbQOkej71gIu
	89UlJMTJiTR93ArIEJdO4184Ovpv5f3//pi82MmE35XhXZ2e63siqB6dwl7qZ1er
	fVD+BRbdl97gflTaiV2boobS8+er7Kt6UPSCsbKpaP70t6m9MhbjaNy/limKoaHJ
	u9qu2h6oGeXq8CgC5ei3yV8gyziMZmGRCWt/Ow3PeeiTtb7FiZCYprmFrNOSpH1y
	rHQZvjvVuzl6IDQ2Yn68xUJe4JKjXPALEO53BOcaI6iLgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsapu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 12:13:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50335bd75bdso500816111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 04:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772540021; x=1773144821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
        b=cCheVy9d9CUlD4NdB4adSfZMbT7rqLNpd+MD6HUdqkxUH0W22mYGhfxZNDYLLD7qPi
         /LbF47kTbXW3sXbslUCno+eAslR+li8y59NtU4Jhxwhr0qFf61x67c8Gy6s4pSbEZH9m
         oksb2zRRGtuUtkJNl/EyhPdNmktC0yEDvJmbKX7MfYcdcZsRsqrD9rk3XxoO00eoU8bK
         scFQLNHdq6CUlqJ1mRstqjCRPu/1NfGUVmTqWWU0keOJa6bmHS8Pija+ejP5o+F0Wida
         UiNkIASWr4w3qFtITIymLOl0bGZgwx67sqcgiloU/2Bw7iZx8CNo4akT0oXCD5/nxfrU
         470Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540021; x=1773144821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
        b=A6XFTSD+bgpPQprz113KmOBbt00UidFQrK8CIEjdIneDreKjh3Mrc/t9XOqCFex3Tr
         60dnuuuY6aGY1yYXsnf91rxrQteUzplx3BBgDecJJwNqEWbjq38zZgzKLy8lxO7uBx0T
         djcGdRafXkiQ1+FsrWy4G6THu8aW7sC6FQQ97c9Y1jIwIDzWWy5v69f1TM+vgEaI3pQq
         m4/OcKJV6zXpFt9zRL3FGr8fwG3Gle1SIGpJVXBGL8RpVt9KNmKKSz1zc6T9R9oi5C7e
         L1gc51bEXqnoE3+Q8LUwTjakgPTgSCv+fk2Nnm7RYNNnsOZ4ULEjAIn62bI5fRRJOuV2
         oVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtDy5UyJ/waOkXIiBYL73z522fbnyQsp/zhWeutWg8GxdwERT27oMWR2w0eAaeKSasJ1GgRcbYlKfTvU13Ppjt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa4PQPqlru8iEoVex+gb5QdOZwMtB5k+GRl5K04kgqhhqC9AYz
	WfEuAGpcomzKs6Y1FtZdo5UiTjeqiqykawuSbr09Q88ZmaXi9Fo2QjHSCSBDd8Q53+TFA1140Q6
	4F00QgSQ/ACjqnOUjLKvBqF7OciH7YQh91sQH5woq5iGVpmDRRKlr3aYt8NMlg2N1x9gbbnflG6
	iB+Q==
X-Gm-Gg: ATEYQzwu12z0M3rBgYhpwVQXlAbNurIqJ8oUr0AN/X85qEXwYnhAWZVgLv4uVETt8uj
	6OSny7xsNezWikVKyRCG2nipupIOdu7Dbno4AsVKC9unq8gVA0Ejcxayo7agmE7hmYVqaZdMu0J
	azUx9pU5gIFpsUVNx9BN2GfVTRrPOiTbdLIH6tmBg7kX5iavL2lEhaIJFURbxOzQukZWVuVQZeB
	VfiyatT/7xe0UMrFWp6WbGReeC+H8aQiGVm33aa5sIH+zEM8P+lqgNXZlikeW7rFfUTZJXIcz4W
	gZRB3TlSM4AGB/1ypOIBtETdy53j9Yn51pXHrn04lkgfkE94+HMV6NDe0ZlgYEr75+61vBmgIZK
	OhmmAMkblfqa32PC5zwxoFHdTuj941DE2gzED
X-Received: by 2002:ac8:57d4:0:b0:506:a289:fd3c with SMTP id d75a77b69052e-5075273e97amr209392611cf.17.1772540020517;
        Tue, 03 Mar 2026 04:13:40 -0800 (PST)
X-Received: by 2002:ac8:57d4:0:b0:506:a289:fd3c with SMTP id d75a77b69052e-5075273e97amr209392191cf.17.1772540019993;
        Tue, 03 Mar 2026 04:13:39 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ad8f8bsm131749141cf.27.2026.03.03.04.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:13:38 -0800 (PST)
Date: Tue, 3 Mar 2026 14:13:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Akshay Bhat <akshay.bhat@timesys.com>,
        Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: imx: imx6q: Fix device node reference leak
 in of_assigned_ldb_sels()
Message-ID: <nfrgeg6uzbkzri5cedihxfw65dnsglytkhbajutuutddvyabuh@mtnjxxde3gzm>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
 <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
 <aYIxjWYq3OwwmrTO@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYIxjWYq3OwwmrTO@lizhi-Precision-Tower-5810>
X-Proofpoint-ORIG-GUID: 4xyQ-4mekBbIlVFcFJ8604GC-jNOvja-
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6d075 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=Vg6-HkV-eu1WfDdlyz8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 4xyQ-4mekBbIlVFcFJ8604GC-jNOvja-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NSBTYWx0ZWRfXzhAxCyyaIXM0
 lx5oduJjkVxf7VdhuW+byofRB7I48LJWj4/LoY7qyZxAIfmgCASVsmWZbYv+pOiC95lwkYlYARP
 QlT0j0091Wg+yAZTmvH1/jgwMWgT0EhEwfUtBE6SrX8xpoURcv7vAsCRT3MVOWZv5Zo6gDX4WVH
 p3bFXtKV83wbVt3qwFn9bAmmN17qgwEwMeAukLh4NthXsRfZ186ex+73Z9pNT5M0mDwwftI+jNu
 +XluqLr02ioCNxQAf9lyjd7cJWnKB6Oz54LbGQ9cCYvTZuJieuhWPblaXOmZYO8dcQkjr5I5FsP
 2w3BzwhDQos+RH733KHSTKcjXaa0HjmkdAMEdLuhacoJYSs54iT+3jabTGjbOxiis73n49vx5E4
 k//Q17l+15h2jrHfPLHCU53980GDuQd4z86bABKB2Ny7p9eqzBCPAV1VAJLe1L8L8kULO3rFnb5
 fExITrXphH0b5c6AEug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_041343_395332_DF7C71EF 
X-CRM114-Status: GOOD (  14.96  )
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

On 26-02-03 12:34:05, Frank Li wrote:
> On Tue, Feb 03, 2026 at 10:07:58PM +0800, Felix Gu wrote:
> > The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
> > but never calls of_node_put() to release the reference, causing a memory
> > leak.
> >
> > Fix this by adding proper cleanup calls on all exit paths.
> >
> > Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank, please trim your replies.

Thanks.

