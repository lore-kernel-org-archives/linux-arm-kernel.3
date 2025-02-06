Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59CAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdipNZI3y5wwEW1WPJkKmfPilkJ7iVaBxEPNzdzmX4E=; b=YzaIeyQk/SNbeeuy1FmkALLVM0
	j8oHRGG66HmJWsEwoUecEi0llNBftXfLbEPQkXI0svLOILWQiUxfRFOm1JpA2GDVIKG2C4+mr+kB4
	Lhb08JqO08xwKMckHFy5Yde2F3C6yVger93dLQWAuR/QCQlX4pj1jHvjCD2JVd5IcvX+RIVSJ1YyZ
	GUFMan+ZC7CGLR7+vseokm19E9LPl1Nktduvk2Hd262WkbilcLE2QEVUlLWrmMqKzr1c6GG3an0Tj
	Y65z0PibB8uWxOlRMgH43VycR2t/hMxNnJaHBeXstyhZuba/7gK7mQNl20WefhzxR3eFVTxkeNkcS
	Djnl26iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg35L-00000006cwT-3ymQ;
	Thu, 06 Feb 2025 14:42:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2u0-00000006aTv-1jAP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738852246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WdipNZI3y5wwEW1WPJkKmfPilkJ7iVaBxEPNzdzmX4E=;
	b=CDkjfouyt5dauUvfIC7ViNGjW3fTIMDVyTCX3dsHs8Z5w4RfUfCxD+D5wQsK8l1cmH2SXN
	0PHJPqTyne8Bmrr7LAmkIQccLhQ6aZwBgP3jzT8lmE3eTqGUXUJSD7kSh575dlDvoxt275
	Bt6yi//cS5ogLeqN+q+v78ujJUn5+so=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-jpp1Wx5AN3GqEECzTVdKQg-1; Thu,
 06 Feb 2025 09:30:43 -0500
X-MC-Unique: jpp1Wx5AN3GqEECzTVdKQg-1
X-Mimecast-MFC-AGG-ID: jpp1Wx5AN3GqEECzTVdKQg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAACC1956086;
	Thu,  6 Feb 2025 14:30:36 +0000 (UTC)
Received: from localhost (unknown [10.2.16.145])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6D97B1800878;
	Thu,  6 Feb 2025 14:30:33 +0000 (UTC)
Date: Thu, 6 Feb 2025 09:30:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <20250206143032.GA400591@fedora>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dVdFjdbROmPA0Gp+"
Content-Disposition: inline
In-Reply-To: <Z6S7A-51SdPco_3Z@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063048_519128_70FC2056 
X-CRM114-Status: GOOD (  13.81  )
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


--dVdFjdbROmPA0Gp+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> And then there are challenges at QEMU level. virtiofsd needs additional
> vhost-user commands to implement DAX and these never went upstream in
> QEMU. I hope these challenges are sorted at some point of time.

Albert Esteve has been working on QEMU support:
https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@redhat.com/

He has a viable solution. I think the remaining issue is how to best
structure the memory regions. The reason for slow progress is not
because it can't be done, it's probably just because this is a
background task.

Please discuss with Albert if QEMU support is urgent.

Stefan

--dVdFjdbROmPA0Gp+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmekx4gACgkQnKSrs4Gr
c8jOKwf/ZukZTp1v1Bj1iqbpAm6HBWN90Y4JWmyzZGuKRqLAwN8AyiIJ6Ms1fx+v
WJLR47NztCQ3sDtsTQT1814wwXSpJlPguLu6isoWbCGpUwAZZk3JTpHNBofs7IKj
04NWFZ9B2tOVgirm8OMtsVVJwzQhvQc7YtMhdB9naCzqcdC7ynKp6mLH9bd7Q+Ze
K9CwEFtKcTm9Ge+t3U0E3Q7MI2D55far3KPi84MpfI9oEu6l0MOzzmKjaOBq9+wy
XXZCisxWbGLZtfbY2BAQxTUhKq9TTXgeQm/Ti/SzsVLf/Qd7nrEkG1v51xs5HCnR
FMQhDw7oBmFsGs5S/Qywvta1pcaYwg==
=JZcT
-----END PGP SIGNATURE-----

--dVdFjdbROmPA0Gp+--


