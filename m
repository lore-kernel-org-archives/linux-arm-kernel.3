Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6D5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mr1OG1oFrmxCKxLaRg8P0aZeIjpmCBFGRrJZ4EUQVo=; b=rnWLGPTUrVhfH6nWhddm0lEUDW
	WYSvfSa1NWaNSOraJ7eY9OluKdskBZhTgx5Lwky7tFtRLo5q+pxDS/nTKovEKzbgnoDrUhm5DjP5v
	I/CumiRub7lpirogV5zc+OKdX+XBU+9phOr/EF3sjoB3+nYVnjuer9/Nn81c7/Gyg1JZtZJY9zAYH
	JylgUfOMwQCw8u308VYWpU8BR82rrGNRgyf5vEtnfA8+lEcJ3axC5WP/nUZ6sfknPzPMpws7OVK9e
	4L+nd9rQNPddomR+Od0Dl5WqS1BfiwqpAp3dxZbP9nrpt/l5WfiA9NxSf9b/Di8ZvLdDEShO2NXbO
	esOF182Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cD7-0000000568S-0MEi;
	Tue, 15 Apr 2025 09:04:05 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cBH-000000055dS-1XWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744707719; x=1745312519; i=markus.elfring@web.de;
	bh=1mr1OG1oFrmxCKxLaRg8P0aZeIjpmCBFGRrJZ4EUQVo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=i4+Z8M34gvBp+cG/jJetMRCF74J+MtGgBx/mehrSYuJJVaW94uKNA6ewUg/E9IVh
	 GDdbCKdH3G/YBVRE3TsNLTyPhGErGq3C4kQS74xY6NmYhDZicK9WZ4ekmgiR/EJqc
	 yS1uaDoDCJwZriTlLIZ2v3TSrYRqyDMBy4dWtf7BZzxFx6JVFMOGh1GLOvSX0zrmm
	 DgoMgCsVecyxzzdHwYsK2LGzChcK4CJBgZcQluZPamQI0oD/9EXTpftOsEYts8t0T
	 2uN7WhpO1M4GIGgun/UTYFraEQxzU8RQvUQFGoRkW74c97wkL6GORgWDJ4yC3MnCo
	 T8v6SSu+a7Wr8RJBTQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.24]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MG9DE-1to6zT22Lk-006HlA; Tue, 15
 Apr 2025 11:01:59 +0200
Message-ID: <e667ee00-12cf-4bd4-9c97-2dad4f2f1f02@web.de>
Date: Tue, 15 Apr 2025 11:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xavier_qy@163.com, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Barry Song <21cnbao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 Gavin Shan <gshan@redhat.com>, Lance Yang <ioworker0@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>
References: <20250415082205.2249918-2-xavier_qy@163.com>
Subject: Re: [mm/contpte v3] mm/contpte: Optimize loop to reduce redundant
 operations
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250415082205.2249918-2-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LJgOMD6FLVAODD0F3B3mIIMTWD8GkOxcEBBdb9b59akGTDGNBGm
 jZsmTkV4Osdi2P776szcbfhHWpgXgS9a7xppOgU3lKIHQKtfO3vLv9J6SRisiWaHQH0YFgy
 DQyzGTXcI4W5MiUEbxqETgv4dBA2wOOwZ04HAsJiyZqvUUkCsdXuoMjL655n113YKFh0W2T
 lOG49yqcvx8LStXsTrdoA==
UI-OutboundReport: notjunk:1;M01:P0:aukuR7+DYGA=;3n4nKZetm2ZBk7c5pkctImDLSzK
 uQYSftoWfLOInjQWDTvziN2xFDNZpz9NeeV8N7+sO0H23onprxPGoGN0d8/KPAagBfTlBa1lK
 15OJyb/gccH3sIcKHIvTK6IKymPqyFoLn/lIP9sUFfLnlGUnRkXndZ5dBPmp/YMhOvwaH3UsR
 dEQOWAg3v3Zsgf/poXJ29Asufq3h4o5+qiSMcyW258FL9q2MRL3ybcLJ1TcBB4HUcY/+ebw+g
 rIQ3LWcS1dLiqocS3nTNC/5lnNZN6xg/+FN9vt6EZF+qe9Gg7G6jUgrlSEFR37SpAMiv0mFWa
 gq2A4KdA//Yw4gsXWgDFGFE+c1Op83olX4pPeSW/B0z3ecHmYYgEjE7uBNG5RKbw/AWHlHy0K
 xaxQRKnmm5P5sPQI2xi1f8RsMuEcUv1NDGVjGvoVrN7bD7g0NJX910ek+q+K2Kch3wbjkEkiP
 9CzH0i/I24JMVT6Eeoju69ads0VVAXZYnM0DG5aHQhmkUq7g7S7FTL/sqx+UcenUZKnTHI3Mw
 TqkoZ2hmeGUD+jgR3HXYDyymViwTU5tO1yV48KzDl05znishD1GJZbrU9N7ykjOKrbTpgiVKV
 ZOD3DGrCzVO0Bd+m+4OJ52iVprR8+5SAwTXtp5v/8jIKSiDUGSZ8MvHppzn5D4fteQ++q0oI9
 ol675b8txM128L/h9h60ZWTE/EW+QQZFt4N7QqUvTHrq1ivKsVkESqHo5pT8IPfW17sT8vbXr
 0Ms/U4qAAs4n0OwQKgCS5IrNYdZ35JKR6Qt06HnEPxyoBO5jgFbBXDzP/zeqkOFzHZHkM/rd2
 kz6TmDALf47eCFe0UXa7wh2se9uxPpSwX7u5RoasJzbK78aTjOqR6jYA/KIYD6CZQkana58qt
 kDvYlm2qocJpXA0xkxW1pIC3aPS5z5TY8nnPonxUMZmHbYuP9OIcRB4VOkIB+92BASDCoOF6s
 qBHY3o90RA3GEaHyM7+lj070zMP1kMYMgIRRcyhRQR3unAYMgpUQFkhwc3MvTWObQeaRd5k3l
 jTyIhXRhCDfDKsOPu5QlhU3uRj4QcKyq0zA6pyocIWWxZfwntEIVrUHdBnRW2OVcY1tL0eRQW
 2CE3mHo51gOPuuDRtR7U3+FmkwKdAqiI4/o2yESq7XVfm1tOp6hx03X7nuLQKfl6dAgUDMf9z
 PzXo6FXe72jhE6YiUyZ4euVUsMwgW9qcoR989iXGGQ93lA52UNVOX3jw6rn/mzJh0A84ffstQ
 wPSZguPlaRrch5iEOd+fRD+aBpIHo03Jh6KQMegxOTS/iha4UmrSzKGfqk37plAlPjBsrG8wn
 ythLgU+6GOdLBYBhPiJzIWShohIXXaGvDEANepydd3O534q37fxfSqYbssBVXfGRCt5kdYSMK
 h+n+GWCOpjOxMUT1IQRMRt0beWOUhEdjN4ratkMq/3nTEFCzhiaXRDK2KOvkh8CHcKrfPARw8
 +8EVXwiFrVnAlvsfD35DSSOJAnxiw5g9+ZJMbpOvJZOvhLXPdO5O3f7dzAyN6a6/qpx0ehA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_020211_771297_4CB88264 
X-CRM114-Status: UNSURE (   5.87  )
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

> This commit optimizes the contpte_ptep_get function by =E2=80=A6

> Signed-off-by: Xavier <xavier_qy@163.com>

I guess that a complete personal name would be more desirable according to
the Developer's Certificate of Origin.
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.15-rc2#n436


Should an other key word be specified for the prefix in the subject?


See also:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.15-rc2#n94

Regards,
Markus

