Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CBA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYtojxRs;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=XyeeDSbE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vE5h/yx8/zL5y/9bVhY/d/nCK5S2dR4yjgKbW3Cj/RU=; b=FYtojxRsV3snQGm6Wcw040bkjo
	vC4Y7bhmxWhmjm018qMt8VTt6kc+MHtSDu9NFDHXNjaFkcoPXzvn9N25t4fpHqjKHvIUQ7jGLI5e9
	+6amfUnANy2DKobTTpLCHbeMFmMbVz8sznAoFqPvYcBZLCKC2XV71TJStocS2+rgv1vWiG7r1QPh0
	RJCQTjAWPFp3t7rPkgPUZZ1Ep429epzTLE5Ge1lYfzuhRRcAm0rms6FouYgOwL8ji8c9k5Ik+pley
	3JguwWEWN5hiEa1vv2fMAA1EiZ10octN9+3x/k5JxKVfDpwrOJMwAR6N7d192lWI7rMWQDUvbleEy
	EzivQNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGAQ-0000000Dgh5-0c96;
	Sat, 31 Oct 2026 20:59:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNGAM-0000000Dggf-3Y33
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:59:08 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998CCC1;
	Sat, 31 Oct 2026 21:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793480205;
	bh=hZ6wxHe7flnyW2Otc3yTvX00TNNSJqtOeZppvOl9ZFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XyeeDSbEiS26R5eqV58/jMD244ohGGgum/nf7blVlok/MLKMG5eXdVvY1c0NQ7mui
	 ecYh+Dqs1woNhEpGahqnRZL38/Ove2snK4DcPW6nQLBPw3LkWCVQrF9WSULHE9UGey
	 +3eq6SRjTgZsiBDAFbxmmfgsruYyQXP46msFWY9o=
Message-ID: <30c65bce25544fc867abfa5abdadf9fc@killaraus.ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Samarth Narang <samarth.colleges@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] media: xilinx: dma - stop_streaming does not wait for a
 running DMA completion callback
Date: Sat, 31 Oct 2026 22:58:34 +0200
In-Reply-To: <20261031202653.4110846-1-samarth.colleges@gmail.com>
References: <20261031202653.4110846-1-samarth.colleges@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_135907_352203_21D323B2 
X-CRM114-Status: GOOD (  36.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This is an automated reply.

You have sent a patch or bug report that appears to have been generated
by an LLM. The commit message, code and/or problem description show
little to no real understanding of the issue and changes being proposed.

Such patches or reports require a large amount of work to handle. They
rely on maintainers to propose - and often even implement - a proper
design. The probability that the author will learn from the experience
to improve their future contributions is close to zero.

As a result, to make good use of maintainer time and keep the kernel
development process sustainable, your contribution has been rejected.

If you believe the change you proposed is important, take time to study
the problem, learn, and develop a solution without AI assistance.
Answering this e-mail or generating a new version of a patch by feeding
this reply to an LLM will only result in your e-mails being ignored.

Please note that if your patch attempted to address an important
problem, maintainers or other contributors can submit and merge a
similar or entirely different fix without crediting you.

Your contributions to the Linux kernel will be welcome if you genuinely
desire to invest your time and learn.

Thank you,

Laurent's mail bot

On Sat, 31 Oct 2026 20:26:53 +0000, Samarth Narang <samarth.colleges@gmail.co=
m> wrote:
> Hi,
>=20
> I think xvip_dma_stop_streaming() can race with an in-progress DMA
> completion callback, potentially causing a buffer to be returned twice
> or accessed after it has been released. The line numbers below refer to
> mainline at 36aad21d50d1.
>=20
> In drivers/media/platform/xilinx/xilinx-dma.c, xvip_dma_stop_streaming()
> calls dmaengine_terminate_all() (line 442) before taking queued_lock and
> returning the buffers on queued_bufs with VB2_BUF_STATE_ERROR (lines
> 449-454). Meanwhile, xvip_dma_complete() takes the same lock, removes
> the completed buffer from the list, and then calls vb2_buffer_done()
> with VB2_BUF_STATE_DONE after releasing the lock (lines 283-296).
>=20
> The Xilinx DMA provider invokes completion callbacks from a tasklet
> after releasing the channel lock. Although xilinx_dma_terminate_all()
> halts the channel and frees its descriptor lists, it does not wait for
> a callback that is already running. That synchronization is handled by
> xilinx_dma_synchronize(), which calls tasklet_kill()
> (drivers/dma/xilinx/xilinx_dma.c, lines 2739-2743), but is not invoked
> by dmaengine_terminate_all().
>=20
> If a completion callback is already running when streaming is stopped,
> the two paths can race over the same buffer. If stop_streaming()
> acquires queued_lock first, it may remove the buffer and return it with
> VB2_BUF_STATE_ERROR before the callback attempts to remove the same list
> entry and return it again with VB2_BUF_STATE_DONE. Even when the
> callback removes the entry first, it may still be using the buffer after
> stop_streaming() returns, at which point videobuf2 may release it. This
> is a callback synchronization issue rather than an outstanding hardware
> DMA transfer, since the engine itself has already been halted.
>=20
> Since stop_streaming() can sleep, I believe dmaengine_terminate_sync()
> would address the race, following the approach used for stm32-dcmi in
> ab32b2c3636b ("media: stm32-dcmi: remove deprecated
> dmaengine_terminate_all()"):
>=20
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -439,7 +439,7 @@ static void xvip_dma_stop_streaming(struct vb2_queue *v=
q)
>  	xvip_pipeline_set_stream(pipe, false);
> =20
>  	/* Stop and reset the DMA engine. */
> -	dmaengine_terminate_all(dma->dma);
> +	dmaengine_terminate_sync(dma->dma);
> =20
>  	/* Cleanup the pipeline and mark it as being stopped. */
>  	xvip_pipeline_cleanup(pipe);
>=20
> There is also a related question about the error path in
> xvip_dma_start_streaming() (lines 422-427), which returns previously
> queued buffers with VB2_BUF_STATE_QUEUED without terminating the DMA
> channel. As far as I can tell, their descriptors remain pending and
> could be issued by a subsequent dma_async_issue_pending(). Is that the
> intended behavior?
>=20
> This issue was identified by a research static analyzer for DMA
> lifecycle ordering and subsequently checked against the client and
> provider implementations. I have not reproduced it on hardware, as I do
> not have access to a Xilinx video pipeline and QEMU does not emulate the
> relevant VDMA or video IP. The proposed change has been compile-tested
> on arm64 with W=3D1.
>=20
> If someone with suitable hardware can confirm the race or test the
> change, I would be happy to submit it as a proper patch.
>=20
> Thanks,
> Samarth
>=20
>=20

