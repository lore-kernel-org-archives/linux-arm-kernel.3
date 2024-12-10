Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DABE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0PnjnuFmwfGJ4/f1r00zdPmTrvRH6FRCjme7Zhxk+8=; b=tbYztB7vWNf6zPzlh+bHPl1sDd
	DYj/4UDrX9ezy+I0Ae9xN97LzIx4mCClHyB3SjkCAgotvJlK+nyxrEZGbdc+Xdz6kI62grA1muUOL
	dUiW9PtbAn4NDQsKfXf6ptm9nL1O1ScFeyCaQFLzH3/IDP+flUHRlZ3AI6xJVyhO+vr3AgeZKvHBC
	+9BUGs37oqfBk7xOPvF0AN8MZ1NBfMZD+fO4WM5gfuIl8lf0ov0rxWNDHVbCftBrdqRiB9omptiw2
	/FrUVwUqiz64dytSaBbr+9HS4tlGxgQ5e/4RzoTFfZAlfXedrA70ox5x+MtKczZN301r5pNlDJNQK
	FqOmOa+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2uV-0000000C3ex-0jt3;
	Tue, 10 Dec 2024 16:16:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2qf-0000000C2xL-3xGx;
	Tue, 10 Dec 2024 16:12:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C1825C5486;
	Tue, 10 Dec 2024 16:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D41C4CED6;
	Tue, 10 Dec 2024 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733847152;
	bh=aeFcHfhyyi6Hrc1ORc56BM7zT3V7KDTDRrWatg2IVuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNyKLcLf9TBPZY/+magH1b8HAo631nln+OPc5sR6f4ayS8hvBfvwQPECC9oIm9ag5
	 LCeTAGJ8duFEitSd1+oL2LJp9rHp5BH4DocBeF2Bv8BdcJtdCaHyWooP0i2kXRRUvq
	 ZcLqGR+StgEpRHOLLCIw3mPcZElRJNRJuN6fbGm39WIn5xZ55aptvWyx9tlGVKz24c
	 KMF8WTpz3g1u0nx65+IjO2ma/Pj0w759l4H3HgL3Uh0tj4dNNLLMonbl4+8bAZYCu6
	 FTJJv/kq4mgaYBi6sPjghLxgc3fEXCou7AiLit1XNSNqte8p5C7RIE05x9BJ4RVNgS
	 xlERbS1/Oj/2g==
Date: Tue, 10 Dec 2024 11:12:30 -0500
From: Sasha Levin <sashal@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	matthias.bgg@gmail.com, elder@kernel.org, ricardo@marliere.net,
	sumit.garg@linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.11 08/15] drm: display: Set fwnode for aux bus
 devices
Message-ID: <Z1hobuvz2S03L9TF@sashalap>
References: <20241204221726.2247988-1-sashal@kernel.org>
 <20241204221726.2247988-8-sashal@kernel.org>
 <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
 <CAGETcx-6yHV5xr1j7krY8LShCF5JATX0NSwjeRUL9+3TLCMq9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx-6yHV5xr1j7krY8LShCF5JATX0NSwjeRUL9+3TLCMq9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_081234_066473_B0862B5D 
X-CRM114-Status: GOOD (  16.49  )
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

On Thu, Dec 05, 2024 at 04:07:45PM -0800, Saravana Kannan wrote:
>On Thu, Dec 5, 2024 at 4:06 PM Saravana Kannan <saravanak@google.com> wrote:
>>
>> On Wed, Dec 4, 2024 at 3:29 PM Sasha Levin <sashal@kernel.org> wrote:
>> >
>> > From: Saravana Kannan <saravanak@google.com>
>> >
>> > [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
>> >
>> > fwnode needs to be set for a device for fw_devlink to be able to
>> > track/enforce its dependencies correctly. Without this, you'll see error
>> > messages like this when the supplier has probed and tries to make sure
>> > all its fwnode consumers are linked to it using device links:
>> >
>> > mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
>> >
>> > Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
>> > Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > Reviewed-by: Thierry Reding <treding@nvidia.com>
>> > Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> > Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google.com
>> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> As mentioned in the original cover letter:
>>
>> PSA: Do not pull any of these patches into stable kernels. fw_devlink
>> had a lot of changes that landed in the last year. It's hard to ensure
>> cherry-picks have picked up all the dependencies correctly. If any of
>> these really need to get cherry-picked into stable kernels, cc me and
>> wait for my explicit Ack.
>>
>> Is there a pressing need for this in 4.19?
>
>I copy pasted this into several replies. In all those cases I meant
>the kernel version mentioned in the subject.

I'll drop this and the other patch you've pointed out, thanks!

-- 
Thanks,
Sasha

