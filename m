Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDBDCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZc1RTV345L63XOq87kbXXoUGCjhUQeZA+2I4SgZPyw=; b=H1djRv0nZuSG2WWqE6dUvoP1yh
	drxsw5x2wPClLWbCFXIufYuD4znaY9N/2IKdUywfdHx4/zfv9QQt2mYA1tR2pJSOoCXrT/uibksqv
	bWno3hQgFJysQ/W6ok7kOzGBZpDYIBqOkeyfGs2E5wY2f6p0xvuyvEpDJHPEk4R9+eX/2flESj4S3
	UeGmCGN7B9VwMQ2LsCmD0hwgaUlAG9gtrMCKtld33HoP5rAAsqBZqlDwnLmDyZGZH6eVh4hA3z8pC
	DadRa4xX28WFi4wlNjJiIS91zfcpqotcEMOrJi0VPl1AUvSZmf/sU01BPMhMYnAMx8LC9g7ySrdD0
	qr8pQOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXv3B-0000000AP8m-0enZ;
	Fri, 12 Jun 2026 06:07:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXv3A-0000000AP8f-1AJa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:07:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CB78408BE;
	Fri, 12 Jun 2026 06:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC501F000E9;
	Fri, 12 Jun 2026 06:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781244447;
	bh=lZc1RTV345L63XOq87kbXXoUGCjhUQeZA+2I4SgZPyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Nx8t/LRc2OA1IAAWEbAg5Bw5U05V1wLwsnIRQp1t1GDuoZYRtK7rtNyrBHcQSsDxn
	 yQkKyG9h0bpw2tHlpzSySWZ7D9tnyJy5mlKycpkTOhIzJJGwnluywW67ItvzQ10XwN
	 wliG7Ioa788JdrnWMw4sCnVuEKNtfcP+fwCaAOXnHeXZtF5aCZA2DqzRoLvLHaaNx2
	 //20IDu5G047ukC+9ozWHjg1Mk6D9DOlQn3ZqmG1+L7BAAobBn9lxdWbMz8kM/cTX0
	 /LEraSEdXp3C8bayXip6r9Astz7Z1aGdI25iHw30aI5ni3NcTVCfi6L16tMw7Ezw3+
	 fcrw27L7jiihA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: "Dan Williams (nvidia)" <djbw@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v7 6/6] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
In-Reply-To: <6a2b103d77596_344af1000@djbw-dev.notmuch>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-7-aneesh.kumar@kernel.org>
 <6a2b103d77596_344af1000@djbw-dev.notmuch>
Date: Fri, 12 Jun 2026 11:37:20 +0530
Message-ID: <yq5ay0gkl2av.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

"Dan Williams (nvidia)" <djbw@kernel.org> writes:

> Aneesh Kumar K.V (Arm) wrote:
>> The SMCCC firmware driver now creates the arm-smccc platform device and
>> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
>> The arm64-specific arm-cca-dev platform device stub is therefore no longer
>> needed.
>> 
>> However, userspace has used the arm-cca-dev platform device to detect Arm
>> CCA Realm guests [1]. Removing it without a replacement would break that
>> detection and would also leave userspace depending on kernel device-model
>> details.
>> 
>> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
>> for detecting whether the kernel is running as an Arm CCA Realm guest. The
>> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
>> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
>> guests.
>> 
>> Remove the dummy arm-cca-dev registration now that userspace has a
>> dedicated CCA Realm guest indicator, and document the new ABI in
>> Documentation/ABI/testing/sysfs-firmware-cca.
>
> I would have expected an attribute in /sys/class/tsm/tsmX to be the
> common protected guest indicator. Then, if you need to distinguish the
> architecture that registered that tsm it would be in the name of the
> parent device for the tsm class device.
>

It is not clear whether we need this capability early, for example in an
initrd configuration before loading the TSM driver, since
systemd-detect-virt reports the CC architecture.

Also, the general feedback was not to depend on device names or paths to
identify a confidential computing guest. Hence, parsing paths such as
../../devices/arm-rmi-dev-1/tsm/tsm0 may not be advisable.

>
> That also gives you the property that a uevent has signalled the arrival
> of tsm guest services. Otherwise, userspace still needs some custom
> device-model details to know when it can start issuing tsm requests.
>
> Is auxilliary device arrival too late in the flow for what systemd
> needs?

Systemd uses that to build part of its trust model.

static int import_credentials_qemu(ImportCredentialsContext *c) {

        if (detect_container() > 0) /* don't access /sys/ in a container */
                return 0;

        if (detect_confidential_virtualization() > 0) /* don't trust firmware if confidential VMs */
                return 0;
....

It also use that to build environment settings 

cv = detect_confidential_virtualization();
if (cv > 0) {
        r = strv_env_assign(&nl, "SYSTEMD_CONFIDENTIAL_VIRTUALIZATION", confidential_virtualization_to_string(cv));

IIUC, this would require the facility to be present even before we can
load the full set of modules.

-aneesh

